class FavModel {
  final String image;
  final String name;
  final String description;

  FavModel({
    required this.image,
    required this.name,
    required this.description,
  });

  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
      image: json["image"],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
