class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
    );
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (!emailRegex.hasMatch(val)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (value == null || value.trim().isEmpty) {
      return 'this field is requried';
    } else if (value.length < 8 || !passwordRegex.hasMatch(value)) {
      return 'Strong password please';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return 'this field is requried';
    } else if (value != password) {
      return 'the password does not match';
    } else {
      return null;
    }
  }

  static String? validateUserName(String? value) {
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (value == null || value.trim().isEmpty) {
      return 'this field is requried';
    } else if (!userNameRegex.hasMatch(value)) {
      return 'please enter valid uasrname';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'this field is requried';
    } else if (value.trim().length != 11) {
      return 'please enter valid phone number';
    } else if (int.tryParse(value.trim()) == null) {
      return 'please enter numbers only';
    } else {
      return null;
    }
  }
}
