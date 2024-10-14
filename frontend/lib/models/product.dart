class Product {
  final String code;
  final String name;
  final String description;
  final String smallDescription;
  final int price;
  final String imageUrl;
  final String category;


  Product({
    required this.code,
    required this.name,
    required this.description,
    required this.smallDescription,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      code: json['code'],
      name: json['name'],
      description: json['description'],
      smallDescription: json['smallDescription'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }

  

}