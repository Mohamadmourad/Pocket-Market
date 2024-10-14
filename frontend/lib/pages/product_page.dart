import 'package:flutter/material.dart';
import 'package:frontend/components/app_bar.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/models/product.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product?;



    return Scaffold(
      appBar: const MyAppBar(),
      body:  ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.network(
            product?.imageUrl ?? 'no img',
            height: 270,
          ),
          const SizedBox(height: 20),
          Text(
            product?.name ?? 'no name',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              )
            ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product?.smallDescription ?? 'no description',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text('Price: ${product?.price.toString() ?? 'no price'} \$',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                    borderRadius:const BorderRadius.only( 
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    border:const Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      left: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        counter>0? counter-- : counter=0;
                      });
                    },
                    icon: const Icon(Icons.remove, color: Colors.white),
                    tooltip: 'remove',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
                Container(
                  height: 60,
                  width: 150,
                  decoration:const  BoxDecoration(
                  border:  Border.symmetric(
                    horizontal: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                  child: Center(
                    child: Text(
                      counter.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                  Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.only( 
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.orangeAccent[400],
                    border:const Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                       counter++;
                      });
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    tooltip: 'add',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 34),
           Container(
                  width: 180,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all( Radius.circular(10)),
                    color: Colors.orangeAccent[400],
                  ),
                  child: TextButton(
                    onPressed: () {
                      if(counter>0){
                        Provider.of<Cart>(context, listen: false).addToCart(product!, quantity: counter);

                        setState(() {
                          counter = 0;
                        });
                      }
                      
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add To Cart', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_cart, color: Colors.white, size: 20,),
                      ],
                    ),  
                  ),
                ),
                const SizedBox(height: 40),
               const Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      "Description :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,),
                      ),
                      
                  ],
                ),
                const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                      product?.description ??'no description',
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        
                      ),
                      ),
                    ),
            ],
          )
        ],
      )
    );
  }
}