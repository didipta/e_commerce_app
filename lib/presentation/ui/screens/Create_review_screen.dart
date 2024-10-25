import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../state_holders/Reviews_controller.dart';
import '../utils/snack_message.dart';

class ReviewCreateScreen extends StatefulWidget {
  final int? productId;
  const ReviewCreateScreen({Key? key, this.productId}) : super(key: key);

  @override
  State<ReviewCreateScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewCreateScreen> {
  final ReviewController _reviewController =
  Get.find<ReviewController>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();


  void _submitReview() async{
    bool result = await _reviewController.createReview(
      widget.productId,
      _descriptionController.text,
      int.parse(_ratingController.text),
    );
    if(result){
      _reviewController.getReviewList(widget.productId!);
      Get.back();
      showSnackBarMessage(
          context,"Review submitted successfully", false);

    }else{
      showSnackBarMessage(
          context,_reviewController.errorMessage.toString(), true);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              textAlign: TextAlign.start,

              decoration: const InputDecoration(labelText: "Description", hintText: "Enter your review here"),
              maxLines: 8,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _ratingController,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                labelText: "Rating",
                hintText: "Enter your rating (1-5)",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                FilteringTextInputFormatter.allow(RegExp(r'^[1-5]$')), // Only allow 1-5
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitReview,
              child: const Text("Submit Review"),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _ratingController.dispose();
    super.dispose();
  }
}

