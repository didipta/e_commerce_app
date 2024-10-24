import 'package:e_commerce_app/data/models/product_model.dart';

class Cartproduct {
  int id;
  int userId;
  int productId;
  String color;
  String image;
  String size;
  String qty;
  String price;
  DateTime createdAt;
  DateTime updatedAt;


  Cartproduct({
    required this.id,
    required this.userId,
    required this.productId,
    required this.color,
    required this.size,
    required this.qty,
    required this.image,
    required this.price,
    required this.createdAt,
    required this.updatedAt,

  });

  Cartproduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['user_id'],
        productId = json['product_id'],
        image = json['image'],
        color = json['color'],
        size = json['size'],
        qty = json['qty'],
        price = json['price'],
        createdAt = DateTime.parse(json['created_at']),
        updatedAt = DateTime.parse(json['updated_at']);



}