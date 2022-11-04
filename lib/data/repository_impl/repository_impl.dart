import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yomo_ecommerce/data/data_source/local_data_source.dart';
import 'package:yomo_ecommerce/data/data_source/remote_data_source.dart';
import 'package:yomo_ecommerce/data/error_handling/exceptions.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/data/network/network_info.dart';
import 'package:yomo_ecommerce/domain/models/models.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  const RepositoryImpl({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        // Get all categorises docs
        final docs = await _remoteDataSource.getAllCategories();
        // Convert it to List<Category>
        final categories =
            docs.map((doc) => Category.fromMap(doc.data() as Map<String, dynamic>)).toList();

        return Right(categories);
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? e.plugin));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts(
    int? productsNum,
    String categoryName,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        // Get all products docs based on productsNum and categoryName
        final docs = await _remoteDataSource.getAllProducts(productsNum, categoryName);

        // Convert it to List<Product>
        final products =
            docs.map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>)).toList();
        return Right(products);
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? AppStrings.empty));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, AppUser>> signup(String email, String password, String name) async {
    if (await _networkInfo.isConnected) {
      try {
        // Sign up user in fire auth
        final user = await _remoteDataSource.signup(email, password);

        // Convert fire auth user into local user to be used in the app
        final appUser = AppUser(id: user.uid, name: name, email: user.email ?? '');

        // Upload user info to fire store
        await _remoteDataSource.uploadUser(appUser);

        // save user to local app preferences
        await _localDataSource.saveUser(appUser);
        return Right(appUser);
      } on FirebaseAuthException catch (e) {
        return Left(Failure.from(e));
      } on NoUserException catch (e) {
        return Left(Failure(title: e.code, message: e.message));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, AppUser>> login(String email, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        // Log in user in fire auth
        final user = await _remoteDataSource.login(email, password);

        // Tries to get the user info form firestore
        final userDocData = (await _remoteDataSource.getUser(user.uid)).data();

        var appUser = AppUser(id: user.uid, name: '', email: user.email ?? '');

        // if user info found convert it to local user
        if (userDocData != null) {
          appUser = AppUser.fromMap(userDocData);
        }

        // if no user info found upload it again to firestore
        else {
          await _remoteDataSource.uploadUser(appUser);
        }
        // save user locally
        await _localDataSource.saveUser(appUser);
        return Right(appUser);
      } on FirebaseAuthException catch (e) {
        return Left(Failure.from(e));
      } on NoUserException catch (e) {
        return Left(Failure(title: e.code, message: e.message));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<void, AppUser>> getUserLocally() async {
    final appUser = await _localDataSource.getUser();
    // If user found locally return it
    return (appUser != null) ? Right(appUser) : const Left(null);
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (await _networkInfo.isConnected) {
      try {
        // Log out user form fire auth
        await _remoteDataSource.logout();
        // Remove user locally
        await _localDataSource.removeUser();

        return const Right(null);
      } on FirebaseAuthException catch (e) {
        return Left(Failure.from(e));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, void>> uploadCart(List<CartItem> items, String userId) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.uploadCart(items, userId);

        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? AppStrings.empty));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCart(String userId) async {
    if (await _networkInfo.isConnected) {
      try {
        // Get all Cart Items docs
        final docs = await _remoteDataSource.getCart(userId);
        // Convert it to List<CartItem>
        final cartItems =
            docs.map((doc) => CartItem.fromMap(doc.data() as Map<String, dynamic>)).toList();

        return Right(cartItems);
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? e.plugin));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, void>> uploadOrder(UserOrder order, String userId) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.uploadOrder(order, userId);
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? e.plugin));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }

  @override
  Future<Either<Failure, List<UserOrder>>> getUserOrder(String userId) async {
    if (await _networkInfo.isConnected) {
      try {
        final docs = await _remoteDataSource.getUserOrder(userId);
        final orders =
            docs.map((doc) => UserOrder.fromMap(doc.data() as Map<String, dynamic>)).toList();
        return (Right(orders));
      } on FirebaseException catch (e) {
        return Left(Failure(title: e.code, message: e.message ?? e.plugin));
      } catch (e) {
        return Left(Failure(title: AppStrings.errorHappened, message: e.toString()));
      }
    } else {
      return Left(Failure.noInternet());
    }
  }
}
