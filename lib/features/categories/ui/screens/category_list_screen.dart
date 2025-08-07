import 'package:ecommerce_app/features/common/controllers/category_controller.dart';
import 'package:ecommerce_app/features/common/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/controllers/main_bottom_nav_bar_controller.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryController _categoryController = Get.find<CategoryController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _categoryController.getCategoryList(); // Initial data load
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter > 300) {
      _categoryController.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent back navigation
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>()
            .moveToHome(); // Navigate back to home
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
        body: GetBuilder<CategoryController>(
          builder: (controller) {
            if (controller.isInitialLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        controller.refreshList();
                      },
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: controller.categoryList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            child: CategoryItem(
                              categoryModel: controller.categoryList[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isLoading,
                    child: LinearProgressIndicator(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
