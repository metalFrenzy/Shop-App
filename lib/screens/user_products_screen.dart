import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import '../providers/products_provider.dart';
import '../widgets/user_product_item.dart';
import '../screens/edit_product_screen.dart';

class UserProducts extends StatelessWidget {
  static const routeName = '/userProducts';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProv>(context);
    final productList = products.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProducts.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) => UserItem(
            productList[i].id,
            productList[i].title,
            productList[i].imageUrl,
          ),
          itemCount: productList.length,
        ),
      ),
    );
  }
}
