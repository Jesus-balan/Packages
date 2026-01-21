import 'package:flutter_test/flutter_test.dart';
import 'package:form_validations_kit/form_validations_kit.dart';

void main() {
  group('FormValidationsKit - Required Rule', () {
    test('returns error when value is null', () {
      final result = EasyFormValidator.validate(
        null,
        rules: [Rules.required()],
      );

      expect(result, 'This field is required');
    });

    test('returns error when value is empty', () {
      final result = EasyFormValidator.validate('', rules: [Rules.required()]);

      expect(result, 'This field is required');
    });

    test('returns null when value is valid', () {
      final result = EasyFormValidator.validate(
        'Hello',
        rules: [Rules.required()],
      );

      expect(result, null);
    });
  });

  group('FormValidationsKit - Email Rule', () {
    test('returns error for invalid email', () {
      final result = EasyFormValidator.validate(
        'invalid-email',
        rules: [Rules.required(), EmailRules.email()],
      );

      expect(result, 'Enter a valid email address');
    });

    test('returns null for valid email', () {
      final result = EasyFormValidator.validate(
        'test@example.com',
        rules: [Rules.required(), EmailRules.email()],
      );

      expect(result, null);
    });
  });

  group('FormValidationsKit - Password Rules', () {
    test('returns error when password is too short', () {
      final result = EasyFormValidator.validate(
        'Ab1',
        rules: [PasswordRules.minLength(8)],
      );

      expect(result, 'Minimum 8 characters required');
    });

    test('returns error when uppercase is missing', () {
      final result = EasyFormValidator.validate(
        'password1',
        rules: [PasswordRules.hasUppercase()],
      );

      expect(result, 'Must contain at least one uppercase letter');
    });

    test('returns null for strong password', () {
      final result = EasyFormValidator.validate(
        'Password1!',
        rules: [
          PasswordRules.minLength(8),
          PasswordRules.hasUppercase(),
          PasswordRules.hasNumber(),
          PasswordRules.hasSpecialChar(),
        ],
      );

      expect(result, null);
    });
  });

  group('FormValidationsKit - Number Rules', () {
    test('returns error for non-numeric input', () {
      final result = EasyFormValidator.validate(
        '123abc',
        rules: [NumberRules.onlyNumbers()],
      );

      expect(result, 'Only numbers are allowed');
    });

    test('returns null for valid phone number', () {
      final result = EasyFormValidator.validate(
        '9876543210',
        rules: [NumberRules.phone()],
      );

      expect(result, null);
    });
  });
}
