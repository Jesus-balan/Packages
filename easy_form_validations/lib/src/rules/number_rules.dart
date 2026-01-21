import '../types.dart';

class NumberRules {
  NumberRules._();

  /// Allows only numbers (0–9)
  static ValidationRule onlyNumbers({
    String message = 'Only numbers are allowed',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (!RegExp(r'^\d+$').hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  /// Minimum numeric value
  static ValidationRule minValue(
    num min, {
    String? message,
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      final number = num.tryParse(value);
      if (number == null || number < min) {
        return message ?? 'Value must be at least $min';
      }
      return null;
    };
  }

  /// Maximum numeric value
  static ValidationRule maxValue(
    num max, {
    String? message,
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      final number = num.tryParse(value);
      if (number == null || number > max) {
        return message ?? 'Value must be at most $max';
      }
      return null;
    };
  }

  /// Exact digits length (useful for OTP, PIN)
  static ValidationRule exactLength(
    int length, {
    String? message,
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (value.length != length) {
        return message ?? 'Must be exactly $length digits';
      }
      return null;
    };
  }

  /// Phone number validation (generic)
  static ValidationRule phone({
    int minLength = 10,
    int maxLength = 10,
    String message = 'Enter a valid phone number',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;

      if (!RegExp(r'^\d+$').hasMatch(value)) {
        return message;
      }

      if (value.length < minLength || value.length > maxLength) {
        return message;
      }

      return null;
    };
  }
}
