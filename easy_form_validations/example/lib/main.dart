import 'package:flutter/material.dart';
import 'package:form_validations_kit/form_validations_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      home: const TestFormScreen(),
    );
  }
}

class TestFormScreen extends StatefulWidget {
  const TestFormScreen({super.key});

  @override
  State<TestFormScreen> createState() => _TestFormScreenState();
}

class _TestFormScreenState extends State<TestFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Easy Form Validations'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Form Validation Demo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Powered by form_validations_kit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // 📧 Email
                    _InputField(
                      label: 'Email address',
                      icon: Icons.email_outlined,
                      validator: (value) =>
                          EasyFormValidator.validate(
                        value,
                        rules: [
                          Rules.required(),
                          EmailRules.email(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // 🔐 Password
                    _InputField(
                      label: 'Password',
                      icon: Icons.lock_outline,
                      obscure: true,
                      controller: _passwordController,
                      validator: (value) =>
                          EasyFormValidator.validate(
                        value,
                        rules: [
                          Rules.required(),
                          PasswordRules.minLength(8),
                          PasswordRules.hasUppercase(),
                          PasswordRules.hasNumber(),
                          PasswordRules.hasSpecialChar(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // 🔐 Confirm Password
                    _InputField(
                      label: 'Confirm Password',
                      icon: Icons.lock_outline,
                      obscure: true,
                      controller: _confirmPasswordController,
                      validator: (value) =>
                          EasyFormValidator.validate(
                        value,
                        rules: [
                          Rules.required(),
                          PasswordRules.confirmPassword(
                            _passwordController.text,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // 📱 Phone
                    _InputField(
                      label: 'Phone number',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      validator: (value) =>
                          EasyFormValidator.validate(
                        value,
                        rules: [
                          Rules.required(),
                          NumberRules.phone(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ✅ Submit Button
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          backgroundColor:
                              Colors.black.withOpacity(0.9),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Form is valid 🎉'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Validate Form',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Reusable input field widget
class _InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscure;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  const _InputField({
    required this.label,
    required this.icon,
    required this.validator,
    this.controller,
    this.obscure = false,
    this.maxLength,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      maxLength: maxLength,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        counterText: '',
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
