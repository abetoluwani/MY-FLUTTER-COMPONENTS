class FormValidator {
  static String? isValidEmail(String? email) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(email!)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? isValidFullName(String? fullName) {
    if (fullName == null || fullName.isEmpty) {
      return 'Please enter your full name.';
    }

    final fullNameRegExp = RegExp(r'^[a-zA-Z ]{3,}(?: [a-zA-Z ]{3,}){1,}$');
    if (!fullNameRegExp.hasMatch(fullName)) {
      return 'Please enter a valid full name.';
    }

    if (fullName.length > 85) {
      return 'Full name must not exceed 85 characters.';
    }

    return null;
  }

  static String? isValidName(String? fullName) {
    if (fullName == null || fullName.isEmpty) {
      return 'Please enter a valid name.';
    }
    if (fullName.length > 85) {
      return 'Name must not exceed 85 characters.';
    }
    if (fullName.length < 3) {
      return 'Name must be atleast 3 Characters';
    }

    return null;
  }

  static String? isValidPhone(String? phoneNo) {
    if (phoneNo == null || phoneNo.isEmpty) {
      return 'Please enter a valid phone number.';
    }
    final regExp =
        RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
    if (!regExp.hasMatch(phoneNo)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password.';
    }

    // Check for at least 8 characters
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    // Check for at least one capital letter, one number, and one symbol
    final capitalLetterRegExp = RegExp(r'[A-Z]');
    final numberRegExp = RegExp(r'[0-9]');
    final symbolRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!capitalLetterRegExp.hasMatch(password) ||
        !numberRegExp.hasMatch(password) ||
        !symbolRegExp.hasMatch(password)) {
      return 'Password must contain at least one capital letter, one number, and one symbol.';
    }

    return null;
  }
}
