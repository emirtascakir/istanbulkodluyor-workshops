import 'package:flutter/material.dart';
import 'package:http_example/models/product.dart';
import 'package:http_example/service/service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Product>> productsFuture = ProductService().fetchProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: FutureBuilder<List<Product>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return displayProducts(products);
          } else {
            return const Text("No Products Found");
          }
        },
      ),
    );
  }

  Widget displayProducts(List<Product> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(children: [
              Text(product.title!),
              Image.network(product.thumbnail!)
            ]),
          );
        });
  }
}
