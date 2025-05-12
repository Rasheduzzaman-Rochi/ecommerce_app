import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/auth/ui/screens/verify_OTP_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _deliveryAdTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 23),
                AppLogo(),
                SizedBox(height: 16),
                Text(
                  context.localization.registerYourAccount,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  context.localization.getStartedWithYourDetails,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.firstName,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.lastName,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: context.localization.phone,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _deliveryAdTEController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: context.localization.deliveryAddress,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: _onTapSignUpButton,
                  child: Text(context.localization.signUp),
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: context.localization.signIn,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, VerifyOTPScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _deliveryAdTEController.dispose();
    super.dispose();
  }
}