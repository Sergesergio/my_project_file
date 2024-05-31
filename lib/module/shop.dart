import 'package:desco/module/product.dart';
import 'package:flutter/foundation.dart';

class Shop extends ChangeNotifier{
  // product for sale
  final List<Product> _shop = [
    Product(
      price: "475",
      name:"Air Jordan",
      description: "Confotable foot wear ",
        imagePath: 'assets/2021903617_ld1.jpg'
    ),
    Product(
      price: "476",
      name:"Sun Glasses",
      description: "Protect eyes from sun",
       imagePath: 'assets/s-l400.jpg'
    ),
    Product(
      price: "567",
      name:"Hand back",
      description: "items.........",
      imagePath: 'assets/Vbiger-Women-3-in-1-Backpack-Tassels-3-Pieces-Shoulders-Bag-Set-PU-Leather-Rhomboids-Backpacks.webp'
    ),
    Product(
      price: "465",
      name:"winter jacket",
      description: "Winter jacket for men",
      imagePath: 'assets/Winter.jpg'
    )
  ];

  // user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  // add to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}