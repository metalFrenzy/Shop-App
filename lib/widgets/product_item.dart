import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../screens/products_detail_screen.dart';
import '../providers/product.dart';
import '../providers/auth_provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );
    final cart = Provider.of<CartProv>(
      context,
      listen: false,
    );
    final auth = Provider.of<AuthProv>(
      context,
      listen: false,
    );
    print(product.isFavorite);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () { 
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(product.imageUrl),
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Colors.deepOrange,
              onPressed: () {
                product.toggleFavorite(
                  auth.token!,
                  auth.userId!,
                );
              }, 
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () => {
              cart.addItem(
                product.id,
                product.price,
                product.title,
              ),
              ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item added to cart!'),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.deleteSingle(product.id);
                    },
                  ),
                ),
              ),
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
