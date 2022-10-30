import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final Repository repository;

  ProductsBloc({required this.repository}) : super(ProductsLoadingState()) {
    on<ProductStarted>((event, emit) async {
      emit(ProductsLoadingState());

      (await repository.getAllProducts(event.productNum, event.categoryName)).fold((failure) {
        emit(ProductsFailureState(failure: failure));
      }, (products) {
        emit(ProductsSuccessState(products: products));
      });
    });
  }
}
