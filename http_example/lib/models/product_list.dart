import 'package:http_example/models/product.dart';

class ProductList {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductList({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    return ProductList(
      products: List<Product>.from(
          json['products'].map((product) => Product.fromJson(product))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
