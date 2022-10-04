import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';
import '../widgets/order_item.dart';
import '../widgets/main_drawer.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/order';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isInt = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInt) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<OrderProv>(context).fetchOrder();
      setState(() {
        _isLoading = false;
      });
    }
    _isInt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: MainDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
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
