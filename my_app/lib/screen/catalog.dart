import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/item.dart';
import '../provider/shoppingcart.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  List<Item> products = [ // List to store catalog items
    Item("Shampoo", 12.5, 123),
    Item("Soap", 13.8, 862),
    Item("Toothpaste", 7.14, 532)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.shop),
                    title: Text(products[index].name),
                    trailing: TextButton(
                      child: const Text('Add'),
                      onPressed: () {
                        context.read<ShoppingCart>().addItem(products[index]); // Adding item to the cart
                      },
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, '/cart'); //will navigate to cart screen
        }
      ),
    );
  }
}