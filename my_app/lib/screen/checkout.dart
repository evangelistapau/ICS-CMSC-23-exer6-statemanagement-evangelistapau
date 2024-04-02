import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: Consumer<ShoppingCart>(    // Using Consumer widget to listen to changes in ShoppingCart state
          builder: (context, prov, child) {
            if (prov.cart.isEmpty) {
              // If the cart is empty, display a message
              return const Text('No items to checkout',style: TextStyle(fontSize: 16),);
            } else {
              return Column(    //display item details and pay now button
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ITEM DETAILS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: prov.cart.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.star),
                          title: Text(prov.cart[index].name),
                          trailing: Text('${prov.cart[index].price}'), // Display item price
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column( 
                      children: [
                    createTotal(prov),
                    createPayNow(context, prov),
                    ],),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  //widget for the displaying of total cost
  Widget createTotal(prov) {
    return Text('Total Cost to Pay: ${prov.getTotal()}');
  }

  //widget for the Pay Now button
  Widget createPayNow(context, prov) {
    return ElevatedButton(
      child: const Text('Pay Now!'),
      onPressed: () {
        prov.removeAll(); //will reset the total to zero because all items were removed
        //snackbar
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Payment Successful!"),duration: Duration(seconds: 1, milliseconds: 200),));
        Navigator.pushNamed(context, '/'); //will go back to the catalog once the button is pushed

      },
    );
  }
}
