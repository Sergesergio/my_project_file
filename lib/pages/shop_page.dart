import 'package:desco/component/my_product_tile.dart';
import 'package:desco/module/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../component/my_drower.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access product in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Shop Page')),
        actions: [
          //go to cart
          IconButton(
              onPressed:() => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),
      drawer:const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25,),
          Center(
            child: Text(
                "pick from a selected list of product",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
          ),
          SizedBox(
            height: 550 ,
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index){
                  //get individual item from shop
                  final product = products[index];
                  //return as product tile ui
                  return ProductTile(product: product);
                }
            ),
          ),
        ]

      ),
    );
  }
}
