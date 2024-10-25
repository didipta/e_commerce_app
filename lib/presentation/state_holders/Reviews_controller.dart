import 'package:e_commerce_app/data/models/review_list_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/Review_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class ReviewController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<Review> _reviewList = [];

  List<Review> get reviewList => _reviewList;

  Future<bool> getReviewList(int id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.ListReviewByProduct(id),
    );
    print(response.responseData['data']);
    if (response.isSuccess) {
      _reviewList = ReviewlistModel.fromJson(response.responseData).ReviewList ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> createReview(int? productId, String review, int rating) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: Urls.CreateProductReview,
      body: {
        "description": review,
        "product_id": productId,
        "rating": rating,
      },
    );
    if (response.isSuccess) {
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