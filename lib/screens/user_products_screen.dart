import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import '../providers/products_provider.dart';
import '../widgets/user_product_item.dart';
import '../screens/edit_product_screen.dart';

class UserProducts extends StatelessWidget {
  static const routeName = '/userProducts';

  Future<void> _refreshProduct(BuildContext context) async {
    await Provider.of<ProductsProv>(context, listen: false).fetchProduct(true);
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _refreshProduct(context),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProduct(context),
                    child: Consumer<ProductsProv>(
                      builder: (context, value, child) => Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                          itemBuilder: (ctx, i) => UserItem(
                            value.items[i].id,
                            value.items[i].title,
                            value.items[i].imageUrl,
                          ),
                          itemCount: value.items.length,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
