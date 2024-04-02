import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart')),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, prov, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder( // ListView to display cart items
                    itemCount: prov.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile( // ListTile for each item in the cart
                        leading: const Icon(Icons.star),
                        title: Text(prov.cart[index].name),
                        trailing: TextButton(
                          child: const Text('Remove'),
                          onPressed: () {
                            context.read<ShoppingCart>().removeItem(prov.cart[index]); // Removing item from the cart
                          }
                        ),
                      );
                    }
                  )
                ),
                createTotal(prov),
                createResetButton(prov),
                createCheckoutButton(context),
                TextButton(
                  child: const Text("Go back to Product Catalog"),
                  onPressed: () {
                    Navigator.pushNamed(context,"/"); // Navigating back to the catalog screen
                  })
              ],
            );
          },
        )
      )
    );
  }
  // Widget for displaying total cost
  Widget createTotal(prov) {
    return Text('Total Cost: ${prov.getTotal()}');
  }

   // Widget for the Reset button
  Widget createResetButton(prov) {
    return ElevatedButton(
      child: const Text('RESET'),
      onPressed: () {
        prov.removeAll();
      },
    );
  }

  // Widget for the Checkout button
  Widget createCheckoutButton(context) {
    return ElevatedButton(
      child: const Text('CHECKOUT'),
      onPressed: () {
        Navigator.pushNamed(context, '/checkout'); // Navigating to the checkout screen
      },
    );
  }

}

