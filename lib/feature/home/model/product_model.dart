
class ProductModel {
  final String id;
  final String status;
  final String category;
  final String name;
  final num price;
  final String description;
  final String image; 
  final List<dynamic> images;
  final String company;

  ProductModel({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
   required this.image, 
    required this.images,
    required this.company,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '', 
      status: json['status'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      image: json["image"] , 
      images: json["images"] as List<dynamic>? ?? [], 
      company: json['company'] ?? '',
    );
  }


}



// class ProductModel {
//   final String id;
//   final String status;
//   final String category;
//   final String name;
//   final num price;
//   final String description;
//   final String image;
//   final List<dynamic> images;
//   final String company;
//   ProductModel({
//     required this.id,
//     required this.status,
//     required this.category,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.image,
//     required this.images,
//     required this.company,
//   });
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['_id'],
//       status: json['status'],
//       category: json['category'],
//       name: json['name'],
//       price: json['price'],
//       description: json['description'],
//       image: json["image"],
//       images: json["images"],
//       company: json['company'],
//     );
//   }
// }
