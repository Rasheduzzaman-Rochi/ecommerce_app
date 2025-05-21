import 'package:ecommerce_app/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: "Electronics",
        );
      },
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 8),
            elevation: 0,
            color: AppColors.themeColor.withOpacity(0.15),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.computer,
                size: 48,
                color: AppColors.themeColor,
              ),
            ),
          ),
          Text(
            "Electronics",
            style: TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
