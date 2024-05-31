import 'package:flutter/material.dart';

import 'my_listtile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // drawer header
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 75,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  )
              ),

              //shop tile
              MyListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart tile
              MyListTile(
                  text: 'Cart',
                  icon: Icons.shopping_bag,
                  onTap:() {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page' );
                  }
              ),
            ],
          ),

          //exit
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
                text: 'Exit',
                icon: Icons.logout,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page',
                        (route) => false)
            ),
          )
        ],
      ),
    );
  }
}
