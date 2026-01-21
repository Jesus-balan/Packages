import '../types.dart';

class PasswordRules {
  PasswordRules._();

  /// Minimum length
  static ValidationRule minLength(int length, {String? message}) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (value.length < length) {
        return message ?? 'Minimum $length characters required';
      }
      return null;
    };
  }

  /// Confirm password match
  static ValidationRule confirmPassword(
    String original, {
    String message = 'Passwords do not match',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (value != original) {
        return message;
      }
      return null;
    };
  }

  /// At least one uppercase letter
  static ValidationRule hasUppercase({
    String message = 'Must contain at least one uppercase letter',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// At least one number
  static ValidationRule hasNumber({
    String message = 'Must contain at least one number',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// At least one special character
  static ValidationRule hasSpecialChar({
    String message = 'Must contain at least one special character',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
        return message;
      }
      return null;
    };
  }
}
