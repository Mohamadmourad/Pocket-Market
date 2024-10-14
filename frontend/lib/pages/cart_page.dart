import 'package:flutter/material.dart';
import 'package:frontend/components/cart_item.dart';
import 'package:frontend/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<Cart>(
        builder: (context, cart, child) {
          return cart.itemCount > 0
              ? FloatingActionButton(
                  backgroundColor: Colors.orange[700],
                  onPressed: () {
                    Navigator.pushNamed(context, '/order');
                  },
                  child: const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                )
              : const SizedBox();
        },
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.orange[700],
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
           Consumer<Cart>(
        builder: (context, cart, child) {
          return cart.itemCount > 0
              ?  Column(
                children: [
                  const SizedBox(height: 10,),
                  Text("Total: ${Provider.of<Cart>(context).totalPrice()} \$", style: const TextStyle(color: Color.fromARGB(255, 112, 112, 112)),),
                  const Divider(),
                ],
              )
              : const SizedBox();
        },
      ),
          Consumer<Cart>(builder: (context, cart, child) {
            return cart.itemCount > 0
                ? Expanded( 
                    child: ListView.builder(
                      itemCount: cart.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cart.cartItems.entries.elementAt(index);
                        final product = cartItem.key;
                        final quantity = cartItem.value;

                        return CartItem(product: product, quantity: quantity);
                      },
                    ),
                  )
                : const Center(child: Text('Your cart is empty', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),));
          }),
        ],
      ),
    );
  }
}
