class SlideModel {
  final String id;
  final String photoUrl;
  final String description;
  final String? brand;
  final String? category;

  SlideModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brand,
    this.category,
  });

  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
      id: json['_id'],
      photoUrl: json['photo_url'],
      description: json['description'],
      brand: json['brand'],
      category: json['category'],
    );
  }
}
