import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';
import '../widgets/order_item.dart';
import '../widgets/main_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: MainDrawer(),
      body: orderData.orders.isEmpty
          ? Center(
              child: Text(
                'You have no orders yet, start ordering!!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => OrderItem(
                orderData.orders[i],
              ),
              itemCount: orderData.orders.length,
            ),
    );
  }
}
