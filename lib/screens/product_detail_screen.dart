import 'package:flutter/material.dart';
import '../models/product.dart';
import '../card/card.dart';
import '../services/product_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;


  const ProductDetailScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: 
         Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(product.description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text(
              'Precio:	\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Categoría:	${product.category}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Calificación:	${product.rating.rate} (${product.rating.count} votos)',
              style: TextStyle(fontSize: 18),
            ),
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Cart.add(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.title} agregado al carrito"),
                  ),
                );
              },

              child: Text("Agrega al carrito"),
            ),
          ],
        ),
      ),
    );
  }
}
