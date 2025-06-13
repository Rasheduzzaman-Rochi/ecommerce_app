import 'package:ecommerce_app/features/categories/ui/screens/category_list_screen.dart';
import 'package:ecommerce_app/features/common/controllers/Home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cart/ui/screens/cart_screen.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../../../wishlist/ui/screens/wish_list_screen.dart';
import '../../controllers/main_bottom_nav_bar_controller.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name = '/main-bottom-nav-bar-screen';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getSliders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return _screens[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return NavigationBar(
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: controller.changeIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                label: 'Wishlist',
              ),
            ],
          );
        },
      ),
    );
  }
}
