import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/cart.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Repository repository;

  CartBloc(this.repository) : super(CartLoadingState()) {
    on<CartStarted>(_onStarted);

    on<CartProductAdded>(_onProductAdded);

    on<CartProductRemoved>(_onProductRemoved);

    on<CartUploaded>(_onCartUploaded);
  }

  _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    final userId = event.userId;
    List<CartItem> items = [];
    if (userId != null) {
      (await repository.getCart(userId)).fold(
        (_) => {items = []},
        (cartItems) => {items = cartItems},
      );
    }
    emit(CartSuccessState(cart: Cart(items: items)));
  }

  _onProductAdded(CartProductAdded event, Emitter<CartState> emit) {
    final cartItem = event.cartItem;
    final items = state.cart?.items;
    final itemIndex = items?.indexWhere((item) => item.id == cartItem.id);

    // If no items then cart is empty
    if (items == null) {
      emit(CartSuccessState(cart: Cart(items: [cartItem])));
    }
    // If the cart has items
    else {
      // If the item exist Update it
      if (itemIndex != -1) {
        final newCartItem = CartItem(
            id: cartItem.id,
            name: cartItem.name,
            imageUrl: cartItem.imageUrl,
            category: cartItem.category,
            price: cartItem.price,
            quantity: cartItem.quantity + 1,
            maxQuantity: cartItem.maxQuantity);
        items[itemIndex!] = newCartItem;
        emit(CartLoadingState());
        emit(CartSuccessState(cart: Cart(items: [...items])));
      }
      // If the item doesn't exist add it
      else {
        emit(CartSuccessState(cart: Cart(items: [...items, cartItem])));
      }
    }
  }

  _onProductRemoved(CartProductRemoved event, Emitter<CartState> emit) {
    final cartItem = event.cartItem;
    final items = state.cart!.items;
    final itemIndex = items.indexWhere((item) => item.id == cartItem.id);

    // If the quantity is 1 then remove the item
    if (cartItem.quantity == 1) {
      items.removeWhere((item) => item.id == cartItem.id);

      // If no items in cart then emit empty items
      if (items.isEmpty) {
        emit(CartLoadingState());
        emit(const CartSuccessState(cart: Cart(items: [])));
      }
      // If items in cart then emit empty state
      else {
        // If items in cart then emit the items after remove the item
        emit(CartLoadingState());
        emit(CartSuccessState(cart: Cart(items: [...items])));
      }
    } else {
      final newCartItem = CartItem(
        id: cartItem.id,
        name: cartItem.name,
        imageUrl: cartItem.imageUrl,
        category: cartItem.category,
        price: cartItem.price,
        quantity: cartItem.quantity - 1,
        maxQuantity: cartItem.maxQuantity,
      );
      items[itemIndex] = newCartItem;
      emit(CartLoadingState());
      emit(CartSuccessState(cart: Cart(items: [...items])));
    }
  }

  _onCartUploaded(CartUploaded event, Emitter<CartState> emit) {
    repository.uploadCart(state.cart!.items, event.userId);
  }
}
