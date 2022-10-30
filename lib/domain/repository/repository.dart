import 'package:dartz/dartz.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/app_user.dart';
import 'package:yomo_ecommerce/domain/models/category.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';

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
}
