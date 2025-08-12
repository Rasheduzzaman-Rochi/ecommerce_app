import 'package:ecommerce_app/features/common/data/models/category_model.dart';
import 'package:ecommerce_app/features/products/ui/controllers/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui/widgets/product_cart.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final CategoryModel category;
  static const String name = '/product-list-screen';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController = ProductListController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productListController.getProductList(widget.category.id);
    _loadData();
  }

  void _loadData() {
    if (_scrollController.position.extentBefore > 300) {
      _productListController.getProductList(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: GetBuilder(
        init: _productListController,
        builder: (context) {
          return GridView.builder(
            itemCount: 30,
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCard());
            },
          );
        },
      ),
    );
  }
}
