import 'package:asignment_2/models/items.dart';
import 'package:asignment_2/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});
  void removeProduct(BuildContext context, Products product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Are you sure?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: (() =>
                Navigator.pop(context, context.read<Items>().remove(product))),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bag = context.watch<Items>().bag;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          'W I S H  L I S T',
          style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: bag.isEmpty
                  ? Center(
                      child: Text(
                        'Empty...',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  : ListView.builder(
                      itemCount: bag.length,
                      itemBuilder: (context, index) {
                        final product = bag[index];
                        return ListTile(
                          title: Text(product.name),
                          subtitle:
                              Text('R${product.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                              onPressed: () {
                                removeProduct(context, product);
                              },
                              icon: const Icon(Icons.delete)),
                        );
                      },
                    )),
        ],
      ),
    );
  }
}
