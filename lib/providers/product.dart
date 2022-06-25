import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavorite() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    var url = Uri.https(
        'flutter-update-5c6c6-default-rtdb.europe-west1.firebasedatabase.app',
        '/products/$id.json');
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavourite': isFavorite,
        }),
      );
      if (response.statusCode >= 400) {
        isFavorite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
