import 'package:e_commerce_app/presentation/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../state_holders/Reviews_controller.dart';
import '../widgets/centered_circular_progress_indicator.dart';

class ReviewScreen extends StatefulWidget {
  final int? id;
  const ReviewScreen({super.key, required this.id});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<ReviewController>().getReviewList(widget.id!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: GetBuilder<ReviewController>(
          builder: (reviewController) {
        if (reviewController.inProgress) {
          return const CenteredCircularProgressIndicator();
        }

        if (reviewController.errorMessage != null) {
          return Center(
            child: Text(reviewController.errorMessage!),
          );
        }

        if (reviewController.reviewList.isEmpty) {
          return const Center(
            child: Text('No reviews yet !'),
          );
        }

        return ListView.builder(
          itemCount: reviewController.reviewList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              margin:  const EdgeInsets.only(bottom: 8),

              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(

                title: Row(
                  children: [
                   Container(

                     decoration: BoxDecoration(

                       shape: BoxShape.circle,

                     ),
                     child: Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.blueGrey.shade100,
                     ),
                   ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Text(reviewController.reviewList[index].profile.cusName,style:TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),),
                        const SizedBox(width: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('('),
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            Text(
                              '${reviewController.reviewList[index].rating}',
                              style:  TextStyle(
                                  fontWeight: FontWeight.w500,

                                  color: Colors.black54),
                            ),
                            Text(')'),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
                subtitle: Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(reviewController.reviewList[index].description.toString())),
              ),
            );

          },
        );
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
    GetBuilder<ReviewController>(
    builder: (reviewController) {
      if (reviewController.inProgress) {
        return Text("");
      }
      return  Text(
        'Reviews (${reviewController.reviewList.length})',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.themeColor,
        ),
      );
    }
    ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.themeColor,
              ),
              child: ElevatedButton(

                onPressed: () {
                  // Handle add review action
                },
                child:Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
