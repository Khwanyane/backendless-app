import 'package:asignment_2/models/items.dart';
import 'package:asignment_2/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  final Products product;
  const ProductsList({super.key, required this.product});
  void addProduct(BuildContext context, Products product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add to wishlist ?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          MaterialButton(
            onPressed: (() =>
                Navigator.pop(context, context.read<Items>().add(product))),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(9),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(product.picture)),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(product.description),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("R${product.price.toStringAsFixed(2)}"),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                      onPressed: () {
                        addProduct(context, product);
                      },
                      icon: const Icon(Icons.favorite_border_outlined)))
            ],
          ),
        ],
      ),
    );
  }
}
