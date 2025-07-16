class CartModel {
  final num quantity;
  final String id;
  final String status;
  final String category;
  final String name;
  final num price;
  final String description;
  final String image;
  final List<dynamic> images;
  final String company;
  final String nationalID;

  CartModel({
    required this.quantity,
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.nationalID,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'] ?? '',
      status: json['status'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      image: json["image"],
      images: json["images"] as List<dynamic>? ?? [],
      company: json['company'] ?? '',
      quantity: json["quantity"],
      nationalID: json["nationalID"] ?? '',
    );
  }
}
