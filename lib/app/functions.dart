/// [validateEmail] based on [emailRegex]
String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

bool validateEmail(String email, String regex) => RegExp(regex).hasMatch(email);

/// [validatePassword] based on [passwordRegex]
String passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

bool validatePassword(String password, String regex) => RegExp(regex).hasMatch(password);
