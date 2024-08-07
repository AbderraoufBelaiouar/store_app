import 'dart:convert';

import 'package:store/models/ratingModel.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Ratingmodel? rating;
  ProductModel(
      {required this.category,
      this.rating,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      rating: Ratingmodel.fromJson(jsonData['rating']),
      category: jsonData['category'],
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'] is int
          ? (jsonData['price'] as int).toDouble()
          : jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
    );
  }
}
