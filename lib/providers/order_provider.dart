import 'package:flutter/material.dart';

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

  void addOrder(double total, List<Cart> cart) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        total: total,
        products: cart,
        time: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
