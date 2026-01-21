import '../types.dart';

class EmailRules {
  EmailRules._();

  /// Validates email format
  static ValidationRule email({
    String message = 'Enter a valid email address',
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return null; // required rule will handle empty
      }

      final emailRegex =
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      if (!emailRegex.hasMatch(value.trim())) {
        return message;
      }
      return null;
    };
  }
}
