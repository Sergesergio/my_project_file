import 'package:desco/module/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../module/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});
  // addToCart
  void  addToCart(BuildContext context) {
    //show dialog box
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Add this item to your cart?'),
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
                  context.read<Shop>().addToCart(product);
    },
              child: const Text('Yes'),
            )
          ],
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                    padding: const EdgeInsets.all(25),
                    width: double.infinity,
                    child: Image.asset(product.imagePath)
                ),
              ),

              const SizedBox(height: 25),


              //product name
              Text(
                  product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 25,),

              //product dest
              Text(
                  product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),

          //price + add to cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '\$${product.price}'
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                    onPressed: () => addToCart(context),
                    icon:const Icon(Icons.add)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
