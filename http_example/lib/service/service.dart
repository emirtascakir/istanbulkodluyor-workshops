import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http_example/models/product.dart';

class ProductService {
  static const String apiUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productsJson = data['products'];

        List<Product> products = productsJson.map((json) {
          return Product.fromJson(json);
        }).toList();
        inspect(products);
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
