import 'package:ecommerce_app/app/app_urls.dart';
import 'package:ecommerce_app/core/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../common/data/models/category_model.dart';

class ProductListController extends GetxController {
  final int _perPageDataCount = 30;

  int _currentPage = 1;

  int? _totalPages;

  bool _isInitialLoading = true;

  bool _isLoading = false;

  List<CategoryModel> _categoryList = [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  int? get totalPages => _totalPages;

  List<CategoryModel> get categoryList => _categoryList;

  bool get isInitialLoading => _isInitialLoading;

  bool get isLoading => _isLoading;

  Future<bool> getCategoryList() async {
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
      url: AppUrls.categoryListUrl,
      queryParams: {'count': _perPageDataCount, 'page': _currentPage},
    );
    if (response.isSuccess) {
      List<CategoryModel> list = [];
      for (Map<String, dynamic> data
      in response.responseData?['data']['results']) {
        list.add(CategoryModel.fromJson(data));
      }
      _categoryList.addAll(list);
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

  Future<bool> refreshList() {
    _currentPage = 0;
    _categoryList = [];
    _isInitialLoading = true;
    return getCategoryList();
  }
}