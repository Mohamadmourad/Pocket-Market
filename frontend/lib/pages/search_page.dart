import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/components/product_card.dart';
import 'package:frontend/models/product.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      search(); 
    });
  }

  bool isSearching = true;
  List<Product> products = [];

  Future<void> search() async {
    final name = ModalRoute.of(context)?.settings.arguments as String?;
    if (name == null) {
      return;
    }
    await dotenv.load();
    final uri = Uri.parse("http://${dotenv.env['IP']}:4000/products/searchName/$name");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final prd = json.decode(response.body);
      
      // Clear previous results if needed
      products.clear();
      
      for (var product in prd) {
        final productObject = Product(
          code: product['code'],
          name: product['name'],
          description: product['description'],
          smallDescription: product['smallDescription'],
          price: product['price'],
          imageUrl: product['image'],
          category: product['category'],
        );
        products.add(productObject);
      }

    } 
     setState(() {
        isSearching = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.orange[700],
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isSearching
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
                strokeWidth: 5,
              ),
            )
          : products.isEmpty ? const Center(
              child: Text(
                'No products found',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) : SingleChildScrollView(
              child: Column(
                children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),  
                      shrinkWrap: true, 
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(product: product);
                      })
                ],
              ),
            )
    );
  }
}
