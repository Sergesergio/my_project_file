import 'package:desco/component/my_button.dart';
import 'package:desco/module/product.dart';
import 'package:desco/module/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //remove from cart method
  void removeItemFromCart(BuildContext context, Product product){
    //show dialog box to ask user to confirm to remove from cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Remove this item to your cart?'),
          actions: [
            //cancel
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const  Text('Cancel'),
            ),
            //yes
            MaterialButton(
              onPressed: () {
                //pop dialog box
                Navigator.pop(context);
                //add to cart
                context.read<Shop>().removeFromCart(product);
              },
              child: const Text('Yes'),
            )
          ],
        )
    );
  }
  void payButtonPressed(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text('We Only Accept Payment Onside!!'),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
            child: Text('Cart Page')
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:  Column(
        children: [
          //cart list
          Expanded(
              child: cart.isEmpty
                  ? const Center(child:Text("your Cart is Empty.."))
                  : ListView.builder(
                itemCount: cart.length,
                  itemBuilder: (context, index){
                    final item = cart[index];

                    //return as a cart tile ui
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  }
              )
          ),
          //payment button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Text('PAY NOW')
            ),
          )
        ],
      ),
    );
  }
}
