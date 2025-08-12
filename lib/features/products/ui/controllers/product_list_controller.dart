import 'package:ecommerce_app/app/app_urls.dart';
import 'package:ecommerce_app/core/network_caller/network_caller.dart';
import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  final int _perPageDataCount = 30;

  int _currentPage = 1;

  int? _totalPages;

  bool _isInitialLoading = true;

  bool _isLoading = false;

  final List<ProductModel> _productList = [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  int? get totalPages => _totalPages;

  List<ProductModel> get productList => _productList;

  bool get isInitialLoading => _isInitialLoading;

  bool get isLoading => _isLoading;

  Future<bool> getProductList(String categoryId) async {
    if (_totalPages != null && _currentPage > _totalPages!) {
      return true; // No more pages to load
    }

    bool isSuccess = false;
    _currentPage++;
    if (!_isInitialLoading) {
      _isLoading = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.productListUrl,
      queryParams: {
        'count': _perPageDataCount,
        'page': _currentPage,
        'category': categoryId,
      },
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> data
          in response.responseData?['data']['results']) {
        list.add(ProductModel.fromJson(data));
      }
      _productList.addAll(list);
      _totalPages = response.responseData!['data']['last_page'];
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (!_isInitialLoading) {
      _isLoading = false;
    } else {
      _isInitialLoading = false;
    }
    update();
    return isSuccess;
  }

  Future<bool> refreshList(String categoryId) {
    _currentPage = 0;
    _productList.clear();
    _isInitialLoading = true;
    return getProductList(categoryId);
  }
}
