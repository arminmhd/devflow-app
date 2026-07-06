class AppAuthValidators {
  // Full Name validator
  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }

    if (!value.contains(" ")) {
      return "Please enter your full name";
    }

    if (value.length < 4) {
      return "Full name must be at least 4 characters";
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return "Invalid email format";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  // Confirm Password
  static String? confirmPassword(String? value, String original) {
    if (value == null || value.trim().isEmpty) {
      return "Please confirm your password";
    }
    if (value != original) {
      return "Passwords do not match";
    }
    return null;
  }
}
