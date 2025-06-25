import 'package:ecommerce_app/app/app_urls.dart';
import 'package:ecommerce_app/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  int _perPageDataCount = 10;

  int _currentPage = 1;

  int? _totalPages;

  bool _isInitialLoading = false;

  Future<void> getCategoryList() async {
    _currentPage++;
    if (_isInitialLoading = false) {
      _isInitialLoading = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.categoryListUrl,
      queryParams: {
        'count' : _perPageDataCount,
        'page': _currentPage,
      }
    );
  }
}