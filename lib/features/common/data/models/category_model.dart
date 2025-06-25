class CategoryModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;

  CategoryModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}