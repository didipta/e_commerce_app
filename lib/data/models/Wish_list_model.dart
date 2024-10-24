class Wishlist {
  int id;
  int productId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  Wishlist({
    required this.id,
    required this.productId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'],
      productId: json['product_id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      product: Product.fromJson(json['product']),
    );
  }

}

class Product {
  int id;
  String title;
  String shortDes;
  String price;
  int discount;
  String discountPrice;
  String image;
  int stock;
  int star;
  String remark;
  int categoryId;
  int brandId;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.title,
    required this.shortDes,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.image,
    required this.stock,
    required this.star,
    required this.remark,
    required this.categoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      shortDes: json['short_des'],
      price: json['price'],
      discount: json['discount'],
      discountPrice: json['discount_price'],
      image: json['image'],
      stock: json['stock'],
      star: json['star'],
      remark: json['remark'],
      categoryId: json['category_id'],
      brandId: json['brand_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

}
