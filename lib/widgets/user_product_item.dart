import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products_provider.dart';

class UserItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProducts.routeName, arguments: id);
              },
              icon: Icon(Icons.edit),
              color: Colors.pinkAccent,
            ),
            IconButton(
              onPressed: () {
                Provider.of<ProductsProv>(context, listen: false)
                    .deleteProduct(id);
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}