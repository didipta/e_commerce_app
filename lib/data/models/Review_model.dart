class Review {
  int id;
  String description;
  String rating;
  int customerId;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;
  Profile profile;

  Review({
    required this.id,
    required this.description,
    required this.rating,
    required this.customerId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.profile,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      description: json['description'],
      rating: json['rating'],
      customerId: json['customer_id'],
      productId: json['product_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      profile: Profile.fromJson(json['profile']),
    );
  }

}

class Profile {
  int id;
  String cusName;

  Profile({
    required this.id,
    required this.cusName,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      cusName: json['cus_name'],
    );
  }

}
