import 'package:ecommerce_app/features/common/data/models/category_model.dart';
import 'package:ecommerce_app/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: categoryModel.title,
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
              child: Image.network(categoryModel.icon, height: 48, width: 48),
            ),
          ),
          Text(
            categoryModel.title,
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