import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/order_provider.dart';
import './screens/products_overview_screen.dart';
import './screens/products_detail_screen.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/4.1 auth_screen.dart';
import './providers/auth_provider.dart';
import './screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProv(),
        ),
        ChangeNotifierProxyProvider<AuthProv, ProductsProv>(
          create: (ctx) => ProductsProv(
            '',
            '',
            [],
          ),
          update: (ctx, auth, previous) => ProductsProv(
            auth.token,
            auth.userId,
            previous == null ? [] : previous.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProv(),
        ),
        ChangeNotifierProxyProvider<AuthProv, OrderProv>(
          create: (ctx) => OrderProv('', '', []),
          update: (ctx, auth, previous) => OrderProv(
            auth.token,
            auth.userId,
            previous == null ? [] : previous.orders,
          ),
        ),
      ],
      child: Consumer<AuthProv>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            canvasColor: Colors.red[50],
          ),
          home: auth.isAuth
              ? ProductOverviewScreen()
              : FutureBuilder(
                  future: auth.tryLogIn(),
                  builder: (context, snapShot) =>
                      snapShot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            UserProducts.routeName: (ctx) => UserProducts(),
            EditProducts.routeName: (ctx) => EditProducts(),
          },
        ),
      ),
    );
  }
}
