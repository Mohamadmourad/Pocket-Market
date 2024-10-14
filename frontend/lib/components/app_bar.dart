// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
    color: Colors.white, 
       ),
      backgroundColor: Colors.orange[700],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        const Text(
        'PocketMart',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        Row(
          children: [
            Container(width:30,child: IconButton(onPressed: (){
              Navigator.pushNamed(context, '/cart');
            }, icon: const Icon(Icons.shopping_cart, color: Colors.white),)),
           Consumer<Cart>(
            builder: (context, cart, child) {
              return cart.itemCount > 0
                ? Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.redAccent, 
                    ),
                    child: Center(
                      child: Text(
                        '${cart.itemCount}', 
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(); 
            },
          )

          ],
        )
      ],)
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
