class BrandModel {
  final String id;
  final String title;
  final String slug;
  final String icon;

  BrandModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.icon,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'].toString(),
      title: json['title'],
      slug: json['slug'],
      icon: json['icon'],
    );
  }
}