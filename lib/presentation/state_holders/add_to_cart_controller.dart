import 'package:get/get.dart';
import '../../data/models/Cart_list_model.dart';
import '../../data/models/Cart_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<Cartproduct> _Cartproduct = [];

  List<Cartproduct> get productList => _Cartproduct;

  Future<bool> addToCart(
      int productId, String color, String size, int quantity) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(url: Urls.addToCart, body: {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity,
    });
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

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.CartList,
    );
    print(response.responseData['data']);
    if (response.isSuccess) {
      print('hgdfhg');
      print(CartlistModel.fromJson(response.responseData).productList);

      _Cartproduct = CartlistModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> deleteCart(int id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.deleteCart(id),
    );
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _Cartproduct.removeWhere((element) => element.id == id);
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
