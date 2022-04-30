import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/order_provider.dart';
import './screens/products_overview_screen.dart';
import './screens/products_detail_screen.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProv(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProv(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderProv(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          canvasColor: Colors.red[50],
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName:(ctx)=> OrderScreen(),
        },
      ),
    );
  }
}
