import 'package:e_commerce_app/presentation/state_holders/Create_Profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/snack_message.dart';
import 'main_bottom_nav_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  final String token;
  CompleteProfileScreen({super.key, required this.token});


  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final CreateProfileController _createProfileController =
  Get.find<CreateProfileController>();
  final _formKey = GlobalKey<FormState>();

  // Controllers to hold form field data
  final TextEditingController _cusNameController =
  TextEditingController();
  final TextEditingController _cusAddController =
  TextEditingController();
  final TextEditingController _cusCityController =
  TextEditingController();
  final TextEditingController _cusStateController =
  TextEditingController();
  final TextEditingController _cusPostcodeController =
  TextEditingController();
  final TextEditingController _cusCountryController =
  TextEditingController();
  final TextEditingController _cusPhoneController =
  TextEditingController();
  final TextEditingController _cusFaxController =
  TextEditingController();

  final TextEditingController _shipNameController =
  TextEditingController();
  final TextEditingController _shipAddController =
  TextEditingController();
  final TextEditingController _shipCityController =
  TextEditingController();
  final TextEditingController _shipStateController =
  TextEditingController();
  final TextEditingController _shipPostcodeController =
  TextEditingController();
  final TextEditingController _shipCountryController =
  TextEditingController();
  final TextEditingController _shipPhoneController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer & Shipping Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Customer Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusNameController,
                  decoration: const InputDecoration(labelText: 'Customer Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusAddController,
                  decoration: const InputDecoration(labelText: 'Customer Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusCityController,
                  decoration: const InputDecoration(labelText: 'Customer City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusStateController,
                  decoration: const InputDecoration(labelText: 'Customer State'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer state';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusPostcodeController,
                  decoration: const InputDecoration(labelText: 'Customer Postcode'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer postcode';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusCountryController,
                  decoration: const InputDecoration(labelText: 'Customer Country'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer country';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusPhoneController,
                  decoration: const InputDecoration(labelText: 'Customer Phone'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cusFaxController,
                  decoration: const InputDecoration(labelText: 'Customer Fax'),
                  keyboardType: TextInputType.phone,
                ),
                const Divider(height: 32),
                const Text('Shipping Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipNameController,
                  decoration: const InputDecoration(labelText: 'Shipping Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipAddController,
                  decoration: const InputDecoration(labelText: 'Shipping Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipCityController,
                  decoration: const InputDecoration(labelText: 'Shipping City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipStateController,
                  decoration: const InputDecoration(labelText: 'Shipping State'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping state';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipPostcodeController,
                  decoration: const InputDecoration(labelText: 'Shipping Postcode'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping postcode';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipCountryController,
                  decoration: const InputDecoration(labelText: 'Shipping Country'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping country';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipPhoneController,
                  decoration: const InputDecoration(labelText: 'Shipping Phone'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() == true) {
      Map<String, String> data = {
        "cus_name": _cusNameController.text,
        "cus_add": _cusAddController.text,
        "cus_city": _cusCityController.text,
        "cus_state": _cusStateController.text,
        "cus_postcode": _cusPostcodeController.text,
        "cus_country": _cusCountryController.text,
        "cus_phone": _cusPhoneController.text,
        "cus_fax": _cusFaxController.text,
        "ship_name": _shipNameController.text,
        "ship_add": _shipAddController.text,
        "ship_city": _shipCityController.text,
        "ship_state": _shipStateController.text,
        "ship_postcode": _shipPostcodeController.text,
        "ship_country": _shipCountryController.text,
        "ship_phone": _shipPhoneController.text
      };

      bool result = await _createProfileController.CreateProfile(data, widget.token);
      if (result) {

        if (mounted) {
          showSnackBarMessage(context, 'Profile created successfully');
        }
        Get.offAll(() => const MainBottomNavScreen());

      } else {
        if (mounted) {
          showSnackBarMessage(context, _createProfileController.errorMessage!);
        }
      }
    }
    else {
      if (mounted) {
        showSnackBarMessage(context, 'Please fill all fields');
      }
    }
  }

  @override
  void dispose() {
    // Dispose of controllers
    _cusNameController.dispose();
    _cusAddController.dispose();
    _cusCityController.dispose();
    _cusStateController.dispose();
    _cusPostcodeController.dispose();
    _cusCountryController.dispose();
    _cusPhoneController.dispose();
    _cusFaxController.dispose();
    _shipNameController.dispose();
    _shipAddController.dispose();
    _shipCityController.dispose();
    _shipStateController.dispose();
    _shipPostcodeController.dispose();
    _shipCountryController.dispose();
    _shipPhoneController.dispose();
    super.dispose();
  }
}
