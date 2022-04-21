import 'package:flutter/material.dart';

import '../widgets/productGrid.dart';

enum FilterOptions {
  Favorties,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lonely Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorties) {
                  _showOnlyFav = true;
                } else {
                  _showOnlyFav = false; 
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorties,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: ProductGrid(_showOnlyFav),
    );
  }
}
