import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yomo_ecommerce/data/error_handling/exceptions.dart';
import 'package:yomo_ecommerce/domain/models/app_user.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';

abstract class RemoteDataSource {
  /// [getAllCategories] from categories collection at firestore
  Future<List<QueryDocumentSnapshot>> getAllCategories();

  /// [getAllProducts] from products collection at firestore
  Future<List<QueryDocumentSnapshot>> getAllProducts(int? productsNum, String categoryName);

  /// [uploadProduct] to products collection at firestore
  Future<void> uploadProduct(Product product);

  /// [signup] user
  Future<User> signup(String email, String password);

  /// [uploadUser] info to users collection at firestore
  Future<void> uploadUser(AppUser appUser);

  /// [login] user
  Future<User> login(String email, String password);

  /// [getUser] info from users collection at firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id);

  /// [logout] user
  Future<void> logout();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final _firestore = FirebaseFirestore.instance;
  final _fireAuth = FirebaseAuth.instance;

  @override
  Future<List<QueryDocumentSnapshot>> getAllCategories() {
    return _firestore.collection('categories').get().then((querySnapshot) => querySnapshot.docs);
  }

  @override
  Future<List<QueryDocumentSnapshot>> getAllProducts(int? productsNum, String categoryName) {
    final productsCollection = _firestore.collection('products');

    /// Get all the products based on [categoryName]
    if (productsNum == null) {
      return productsCollection
          .where('category', isEqualTo: categoryName)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    }

    /// Get limited products based on [categoryName]
    else {
      return productsCollection
          .where('category', isEqualTo: categoryName)
          .limit(productsNum)
          .get()
          .then((querySnapshot) => querySnapshot.docs);
    }
  }

  @override
  Future<void> uploadProduct(product) async {
    return _firestore.collection('products').doc().set(product.toMap());
  }

  @override
  Future<User> signup(String email, String password) async {
    final UserCredential userCredential =
        await _fireAuth.createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;

    // If for no reason the user can't be created then throw exception
    return (user != null) ? user : throw const NoUserException();
  }

  @override
  Future<User> login(String email, String password) async {
    final UserCredential userCredential =
        await _fireAuth.signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;

    // If for no reason the user can't be created then throw exception
    return (user != null) ? user : throw const NoUserException();
  }

  @override
  Future<void> uploadUser(AppUser appUser) async {
    return _firestore.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id) async {
    return await _firestore.collection('users').doc(id).get();
  }

  @override
  Future<void> logout() => _fireAuth.signOut();
}
