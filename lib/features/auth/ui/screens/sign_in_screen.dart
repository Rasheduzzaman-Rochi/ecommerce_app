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
      body: Column(
        children: [
          const SizedBox(height: 60),
          AppLogo(),
          Text('Welcome Back', style: textTheme.titleLarge),
          Text('Enter your Email and Password', style: TextStyle(
            color: Colors.grey,
          ),),
          TextFormField(),
          TextFormField(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
