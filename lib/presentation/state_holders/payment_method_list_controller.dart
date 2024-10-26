
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/payment_method_model.dart';
import '../../data/models/payment_method_response_data.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class PaymentMethodListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  PaymentMethodResponseData? _paymentMethodResponseData;

  PaymentMethodResponseData? get paymentMethodResponseData => _paymentMethodResponseData;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getPaymentMethodList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.createInvoice,
    );

    if (response.isSuccess) {
      _paymentMethodResponseData =
          PaymentMethodModel.fromJson(response.responseData).data?.first;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
