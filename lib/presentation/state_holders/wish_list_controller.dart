import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/Wish_list_model.dart';
import '../../data/models/network_response.dart';
import '../../data/models/wish_lists_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class WishListController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<Wishlist> _wishList = [];

  List<Wishlist> get wishList => _wishList;

  Future<bool> Createlist(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.CreateWishList(productId),
    );
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.WishList,
    );
    print(response.responseData['data']);
    if (response.isSuccess) {
      _wishList = WishListsModel.fromJson(response.responseData).productList ?? [];


      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> deleteWishList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.deleteWishList(productId),
    );
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _wishList.removeWhere((element) => element.productId == productId);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}