import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dos_uno_dos/models/models.dart';
import 'package:dos_uno_dos/screens/screens.dart';
import 'package:dos_uno_dos/widgets/widgets.dart';
import 'package:dos_uno_dos/services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    if (productService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (
          BuildContext context,
          int index
        ) => GestureDetector(
          onTap: () {
            productService.selectedProduct = productService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productService.products[index],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.selectedProduct = Product(
            available: false,
            name: '',
            price: 0
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}