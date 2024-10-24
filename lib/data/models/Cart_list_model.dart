import 'Cart_model.dart';

class CartlistModel{

  String? msg;
  List<Cartproduct>? productList;

  CartlistModel({this.msg, this.productList});

  CartlistModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <Cartproduct>[];
      json['data'].forEach((v) {
        productList!.add(Cartproduct.fromJson(v));
      });
    }
  }
}