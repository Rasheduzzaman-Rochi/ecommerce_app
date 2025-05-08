import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              AppLogo(),
              SizedBox(height: 24),
              Text('Welcome Back', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Enter your Email and Password',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 16),
              TextFormField(decoration: InputDecoration(hintText: "Email")),
              const SizedBox(height: 8),
              TextFormField(decoration: InputDecoration(hintText: "Password")),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Sign In')),
            ],
          ),
        ),
      ),
    );
  }
}
