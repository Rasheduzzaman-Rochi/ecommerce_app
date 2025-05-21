import 'package:ecommerce_app/features/common/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../common/controllers/main_bottom_nav_bar_controller.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent back navigation
      onPopInvokedWithResult: (_,__) {
        Get.find<MainBottomNavBarController>().moveToHome(); // Navigate back to home
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().moveToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: CategoryItem());
            },
          ),
        ),
      ),
    );
  }
}