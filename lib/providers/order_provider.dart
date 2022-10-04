import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './cart_provider.dart';

class Order {
  final String id;
  final double total;
  final List<Cart> products;
  final DateTime time;

  Order({
    required this.id,
    required this.total,
    required this.products,
    required this.time,
  });
}

class OrderProv with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  final String? authToken;
  final String userId;

  OrderProv(this.authToken, this.userId, this._orders);

  Future<void> fetchOrder() async {
    var url = Uri.parse(
        'https://flutter-update-5c6c6-default-rtdb.europe-west1.firebasedatabase.app/orders/$userId.json?auth=$authToken');
    final response = await http.get(url);
    final List<Order> loadedOrders = [];
    final data = json.decode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      return;
    }
    data.forEach((key, value) {
      loadedOrders.add(
        Order(
          id: key,
          total: value['amount'],
          products: (value['products'] as List<dynamic>)
              .map(
                (item) => Cart(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
          time: DateTime.parse(
            value['dateTime'],
          ),
        ),
      );
    });
    _orders = loadedOrders;
    notifyListeners();
  }

  Future<void> addOrder(double total, List<Cart> cart) async {
    var url = Uri.parse(
        'https://flutter-update-5c6c6-default-rtdb.europe-west1.firebasedatabase.app/orders/$userId.json?auth=$authToken');
    final timeStamp = DateTime.now();
    try {
      final res = await http.post(
        url,
        body: json.encode({
          'amount': total,
          'dateTime': timeStamp.toIso8601String(),
          'products': cart
              .map((e) => {
                    'id': e.id,
                    'title': e.title,
                    'quantity': e.quantity,
                    'price': e.price,
                  })
              .toList()
        }),
      );
      _orders.insert(
        0,
        Order(
          id: json.decode(res.body)['name'],
          total: total,
          products: cart,
          time: DateTime.now(),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
