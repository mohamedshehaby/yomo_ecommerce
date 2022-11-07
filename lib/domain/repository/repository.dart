import 'package:dartz/dartz.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/models.dart';

abstract class Repository {
  /// [getAllCategories] from firebase or return failure
  Future<Either<Failure, List<Category>>> getAllCategories();

  /// [getAllProducts] from firebase or return failure
  Future<Either<Failure, List<Product>>> getAllProducts(int? productsNum, String categoryName);

  /// [signup] user to firebase or return failure
  Future<Either<Failure, AppUser>> signup(String email, String password, String name);

  /// [login] user to firebase or return failure
  Future<Either<Failure, AppUser>> login(String email, String password);

  /// [logout] user to firebase or return failure
  Future<Either<Failure, void>> logout();

  /// [getUserLocally] form local app preferences
  Future<Either<void, AppUser>> getUserLocally();

  /// [uploadCart]
  Future<Either<Failure, void>> uploadCart(List<CartItem> items, String userId);

  /// [getCart]
  Future<Either<Failure, List<CartItem>>> getCart(String userId);

  /// [uploadOrder]
  Future<Either<Failure, void>> uploadOrder(UserOrder order, String userId);

  /// [getUserOrder]
  Future<Either<Failure, List<UserOrder>>> getUserOrder(String userId);

  /// [getUser]
  Future<Either<Failure, AppUser>> getUser(String userId);

  /// [removeUser]
  Future<Either<Failure, void>> removeUser(String userId);
}
