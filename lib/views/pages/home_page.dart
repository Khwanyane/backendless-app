import 'package:asignment_2/models/items.dart';
import 'package:asignment_2/routes/routes.dart';
import 'package:asignment_2/views/widgets/drawer.dart';
import 'package:asignment_2/views/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Items>().items;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          'R A R E  F I N D Z ',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteManager.wishList);
            },
            icon: const Icon(Icons.shopping_bag),
            color: Colors.black,
          ),
        ],
      ),
      drawer: const NavugationDrawer(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductsList(product: product);
        },
      ),
    );
  }
}
