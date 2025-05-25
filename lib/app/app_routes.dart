import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce_app/features/products/ui/screens/product_list_screen.dart';
import 'package:ecommerce_app/features/products/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';
import '../features/auth/ui/screens/sign_in_screen.dart';
import '../features/auth/ui/screens/verify_OTP_screen.dart';
import '../features/common/ui/Screens/main_bottom_nav_bar_screen.dart';
import '../features/products/ui/screens/create_review_screen.dart';
import '../features/products/ui/screens/product_details_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    } else if (settings.name == SignInScreen.name) {
      route = const SignInScreen();
    } else if (settings.name == SignUpScreen.name) {
      route = const SignUpScreen();
    } else if (settings.name == VerifyOTPScreen.name) {
      route = const VerifyOTPScreen();
    } else if (settings.name == MainBottomNavBarScreen.name) {
      route = const MainBottomNavBarScreen();
    } else if (settings.name == ProductListScreen.name) {
      final String category = settings.arguments as String;
      route = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      route = const ProductDetailsScreen();
    } else if (settings.name == ProductReviewScreen.name) {
      route = const ProductReviewScreen();
    } else if (settings.name == CreateReviewScreen.name) {
      route = const CreateReviewScreen();
    } else {
      route = const SplashScreen();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}