import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_app/features/common/ui/Screens/main_bottom_nav_bar_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/centered_circular_progress_indicator.dart';
import '../../../../core/widgets/show_snack_bar_message.dart';
import '../controllers/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 70),
                AppLogo(),
                SizedBox(height: 24),
                Text(
                  context.localization.welcomeBack,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  context.localization.enterYourEmailAndPassword,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                  validator: (String? value) {
                    String email = value ?? '';
                    if (!EmailValidator.validate(email)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || value!.length < 6) {
                      return 'Enter a password with at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<SignInController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapSignInButton,
                        child: Text(context.localization.signIn),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: context.localization.signUp,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, SignUpScreen.name);
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

  Future<void> _onTapSignInButton() async {
    if (_formKey.currentState!.validate()) {
      SignInRequestModel signInRequestModel = _buildSignInRequestModel();
      final bool isSuccess = await _signInController.signIn(signInRequestModel);
      if (!mounted) return;
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainBottomNavBarScreen.name,
          (value) => false,
        );
      } else {
        showSnackBarMessage(context, _signInController.errorMessage!, true);
      }
    }
  }

  SignInRequestModel _buildSignInRequestModel() {
    return SignInRequestModel(
      email: _emailTEController.text.trim(),
      password: _passwordTEController.text,
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}