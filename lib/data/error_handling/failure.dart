import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';

class Failure {
  final String title;
  final String message;

  const Failure({
    required this.title,
    required this.message,
  });

  factory Failure.from(FirebaseAuthException exception) =>
      authFailureMapping[exception.code.toLowerCase().trim()] ?? const FailureUnknown();

  factory Failure.noInternet() =>
      const Failure(title: AppStrings.noInternetTitle, message: AppStrings.noInternetMessage);
}

const Map<String, Failure> authFailureMapping = {
  'user-not-found': FailureUserNotFound(),
  'weak-password': FailureWeakPassword(),
  'invalid-email': FailureInvalidEmail(),
  'operation-not-allowed': FailureOperationNotAllowed(),
  'email-already-in-use': FailureEmailAlreadyInUse(),
  'requires-recent-login': FailureRequiresRecentLogin(),
  'no-current-user': FailureNoCurrentUser(),
};

// !auth/email-already-in-use
@immutable
class FailureEmailAlreadyInUse extends Failure {
  const FailureEmailAlreadyInUse()
      : super(
          title: 'Email already in use',
          message: 'Please choose another email to register with!',
        );
}

// !auth/invalid-email
@immutable
class FailureInvalidEmail extends Failure {
  const FailureInvalidEmail()
      : super(
          title: 'Invalid email',
          message: 'Please double check your email and try again!',
        );
}

// !auth/no-current-user
// * Edge Case
// ? when the user tries to Logout but no user exists
@immutable
class FailureNoCurrentUser extends Failure {
  const FailureNoCurrentUser()
      : super(
          title: 'No current user!',
          message: 'No current user with this information was found!',
        );
}

// !auth/operation-not-allowed
//? The provided sign-in provider is disabled for your Firebase project.
//? Enable it from the Sign-in Method section of the Firebase console.
@immutable
class FailureOperationNotAllowed extends Failure {
  const FailureOperationNotAllowed()
      : super(
          title: 'Operation not allowed',
          message: 'You cannot register using this method at this moment!',
        );
}

// !auth/requires-recent-login
// ? when the user not logged in in a long time so firebase
// ? might through exception  to log in again
@immutable
class FailureRequiresRecentLogin extends Failure {
  const FailureRequiresRecentLogin()
      : super(
          title: 'Requires recent login',
          message: 'You need to log out and log back in again in order to perform this operation',
        );
}

@immutable
class FailureUnknown extends Failure {
  const FailureUnknown()
      : super(
          title: 'Authentication Failure',
          message: 'Unknown authentication Failure',
        );
}

// !auth/user-not-found
@immutable
class FailureUserNotFound extends Failure {
  const FailureUserNotFound()
      : super(
          title: 'User not found',
          message: 'The given user was not found on the server!',
        );
}

// !auth/weak-password
@immutable
class FailureWeakPassword extends Failure {
  const FailureWeakPassword()
      : super(
          title: 'Weak password',
          message: 'Please choose a stronger password consisting of more characters!',
        );
}
