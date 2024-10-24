import 'Wish_list_model.dart';

class WishListsModel {
  String? msg;
  List<Wishlist>? productList;

  WishListsModel({this.msg, this.productList});

  WishListsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <Wishlist>[];
      json['data'].forEach((v) {
        productList!.add(Wishlist.fromJson(v));
      });
    }
  }
}