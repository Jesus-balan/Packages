import '../types.dart';

class EasyFormValidator {
  EasyFormValidator._();

  static String? validate(
    String? value, {
    required List<ValidationRule> rules,
  }) {
    for (final rule in rules) {
      final error = rule(value);
      if (error != null) return error; // 🚀 fast exit
    }
    return null;
  }
}
