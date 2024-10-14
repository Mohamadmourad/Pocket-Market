// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/product.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Product product;
  final int quantity;
  const CartItem({super.key , required this.product, required this.quantity});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
          child: Row(
            children: [
              Image.network(
                widget.product.imageUrl,
                height: 130,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      widget.product.name,
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  Text('Price: ${widget.product.price} \$'),
                  Text('Quantity: ${widget.quantity}'),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).removeFromCart(widget.product);
          },
          icon: const Icon(Icons.delete,color: Colors.red,),
        ),
      ],),
    );
  }
}