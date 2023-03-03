import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../screens/cart_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_app/providers/poducts.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    //final productContainer = Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedValue) {
              setState(() {
                if (selectedValue == 0) {
                  //  productContainer.showfavoriteOnly();
                  _showOnlyFavorites = true;
                } else {
                  // productContainer.showAll();
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only Favorite"),
                value: 0,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: 1,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badgee(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart),
              ),
              value: cartData.itemCount.toString(),
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
