form_validations_kit

A simple, reusable, and production-ready form validation engine for Flutter.
Build clean, readable, and scalable validations without coupling logic to UI.

Lightweight • Rule-based • Testable • No UI dependency

🚀 Why form_validations_kit?

In most Flutter apps, validation logic becomes:

❌ Duplicated across screens

❌ Tightly coupled to UI

❌ Hard to test and maintain

form_validations_kit solves this by providing a rule-based validation engine that is:

✅ Composable

✅ Reusable

✅ Easy to test

✅ Production ready

✨ Features

Rule-based validation

Email validation

Password strength rules

Confirm password support

Phone & number validation

Fast-exit validation (first error only)

Clean and readable API

No UI dependency

🎬 Example App

![Form Validation Demo](https://raw.githubusercontent.com/Jesus-balan/Packages/main/easy_form_validations/assets/images/form_validation_demo.gif)

📦 Installation

Add the package to your pubspec.yaml:

dependencies:
  form_validations_kit: ^0.0.4


Then run:

flutter pub get

📖 Usage

Designed to work seamlessly with Flutter Form and TextFormField.

✨ Basic Required Validation
TextFormField(
  validator: (value) => EasyFormValidator.validate(
    value,
    rules: [
      Rules.required(),
    ],
  ),
);

📧 Email Validation
TextFormField(
  keyboardType: TextInputType.emailAddress,
  validator: (value) => EasyFormValidator.validate(
    value,
    rules: [
      Rules.required(),
      EmailRules.email(),
    ],
  ),
);

🔐 Password Validation
TextFormField(
  obscureText: true,
  validator: (value) => EasyFormValidator.validate(
    value,
    rules: [
      PasswordRules.minLength(8),
      PasswordRules.hasUppercase(),
      PasswordRules.hasNumber(),
      PasswordRules.hasSpecialChar(),
    ],
  ),
);

🔁 Confirm Password Validation
TextFormField(
  obscureText: true,
  validator: (value) => EasyFormValidator.validate(
    value,
    rules: [
      Rules.required(),
      Rules.match(passwordController.text),
    ],
  ),
);

📞 Phone Number Validation
TextFormField(
  keyboardType: TextInputType.phone,
  validator: (value) => EasyFormValidator.validate(
    value,
    rules: [
      Rules.required(),
      NumberRules.phone(),
    ],
  ),
);

✅ Validate an Entire Form
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      // form fields here
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print('Form is valid 🎉');
          }
        },
        child: const Text('Submit'),
      ),
    ],
  ),
);