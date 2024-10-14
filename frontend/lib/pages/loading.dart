import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/models/product.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getProducts(); 
  }

  Future<void> getProducts() async {
    Map<String, List<dynamic>> productsList = {};
    await dotenv.load();
    final uri = Uri.parse("http://${dotenv.env['IP']}:4000/products");
    final response = await http.get(uri);

    if(response.statusCode == 200){
      final products = json.decode(response.body);
      for(var product in products){
        final prd = Product(
          code: product['code'],
          name: product['name'],
          description: product['description'],
          smallDescription: product['smallDescription'],
          price: product['price'],
          imageUrl: product['image'],
          category: product['category'],
        );
        if(productsList.keys.contains(prd.category)){
          productsList[prd.category]?.add(prd);
        }else{
          productsList[prd.category] = [prd];
        }

      }


      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home', arguments: productsList);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Colors.orange,
          size: 200,
        ),
      ),
    );
  }
}
