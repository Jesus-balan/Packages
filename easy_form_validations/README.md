<h1 align="center">form_validations_kit</h1>

<p align="center">
  Rule-based • Testable • No UI dependency • Flutter
</p>

<p align="center">
  <a href="https://pub.dev/packages/form_validations_kit">
    <img src="https://img.shields.io/pub/v/form_validations_kit.svg" />
  </a>
  <img src="https://img.shields.io/pub/likes/form_validations_kit" />
  <img src="https://img.shields.io/pub/points/form_validations_kit" />
  <img src="https://img.shields.io/github/license/Jesus-balan/Packages" />
</p>

---

## 🚀 Overview

**form_validations_kit** is a lightweight, reusable, and production-ready  
**form validation engine for Flutter**.

It helps you keep validation logic:
- clean  
- reusable  
- testable  
- independent from UI  

No more duplicated validators across screens.

---

## ✨ Features

- ✅ Rule-based validation engine  
- 📧 Email validation  
- 🔐 Password strength rules  
- 🔁 Confirm password matching  
- 📞 Phone & numeric validation  
- ⚡ Fast-exit validation (first error only)  
- 🧪 Pure Dart, easy to test  
- 🎯 No UI dependency  

---

## 📱 Platform Support

| Platform | Supported |
|----------|-----------|
| Android  | ✅ |
| iOS      | ✅ |
| Web      | ✅ |
| Windows  | ✅ |
| macOS    | ✅ |
| Linux    | ✅ |

---

## 🎬 Example App

<p align="center">
  <img src="https://raw.githubusercontent.com/Jesus-balan/Packages/main/easy_form_validations/assets/images/form_validation_demo.gif" width="300" />
</p>

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  form_validations_kit: ^0.0.5

Then run:

  flutter pub get


## Usage

Designed to work seamlessly with Flutter Form and TextFormField.

### Required Field

Ensures the field is not empty.

```dart
TextFormField(
  validator: (value) => EasyFormValidator.validate(
    value,
    rules: [Rules.required()],
  ),
);

### Email Validation

Ensures the field is not empty.

```dart
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

### Password Validation

Ensures the field is not empty.

```dart
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

### Confirm Password Validation

Ensures the field is not empty.

```dart
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


### Phone Number Validation

Ensures the field is not empty.

```dart
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

### Validate an Entire Form

Ensures the field is not empty.

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      // form fields
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
