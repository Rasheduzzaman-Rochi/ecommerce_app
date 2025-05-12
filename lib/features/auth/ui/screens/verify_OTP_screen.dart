import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/core/extensions/localization_extension.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  static const String name = '/verify-OTP';

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 70),
              const AppLogo(),
              const SizedBox(height: 24),
              Text(
                context.localization.enterYourOtpCode,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                context.localization.aFourDigitCodeHasBeenSent,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 24),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 56,
                  fieldWidth: 52,
                  activeColor: AppColors.themeColor,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEController,
                appContext: context,
                //This makes the boxes close but slightly spaced
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle OTP submission
                },
                child: Text(context.localization.verify),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: context.localization.thisCodeWillExpireIn,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: context.localization.oneTwoZeroS,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: context.localization.resendCode,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
