import '../types.dart';

class Rules {
  Rules._();

  static ValidationRule required({
    String message = 'This field is required',
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return message;
      }
      return null;
    };
  }
}
