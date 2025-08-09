import 'brand_model.dart';

class ProductModel {
  final String id;
  final String title;
  final BrandModel brand;
  final int regularPrice;
  final int currentPrice;
  final double rating;
  final List<String> photos;
  final List<String> sizes;
  final List<String> colors;
  final int availableQuantity;

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.regularPrice,
    required this.currentPrice,
    required this.rating,
    required this.photos,
    required this.sizes,
    required this.colors,
    required this.availableQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'].toString(),
      title: json['title'],
      brand: BrandModel.fromJson(json['brand']),
      regularPrice: json['regular_price'],
      currentPrice: json['current_price'],
      rating: json['rating'] ?? 0.0,
      photos: json['photos'],
      sizes: json['sizes'],
      colors: json['colors'],
      availableQuantity: json['quantity'],
    );
  }
}