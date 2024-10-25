import 'package:e_commerce_app/data/models/Review_model.dart';

class ReviewlistModel {
  String? msg;
  List<Review>? ReviewList;

  ReviewlistModel({this.msg, this.ReviewList});

  ReviewlistModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      ReviewList = <Review>[];
      json['data'].forEach((v) {
        ReviewList!.add(Review.fromJson(v));
      });
    }
  }
}