import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class CreateProfileController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;



  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;



  Future<bool> CreateProfile(Map<String,String> profileData) async {
    bool isSuccess = false;
    _inProgress = true;
    update(); // Notify listeners that the state has changed

    // Call the network service to create a profile
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: Urls.CreateProfile,
      body: profileData, // Passing profile data
    );

    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMessage = null;

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage; // Capture error message
    }

    _inProgress = false;
    update(); // Notify listeners again after request completes
    return isSuccess;
  }

}