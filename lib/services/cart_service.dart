import '../models/cart.dart';
import "dart:convert";

import "package:http/http.dart" as http;



class CartService {
  static const String _baseUrl = "fakestoreapi.com";
  static const String _productsPath = "/cart";

  Future<List<Cart>> fetchCart(int id) async {
    final Uri url = Uri.https(_baseUrl, _productsPath, {"id": id.toString()});
    
    final response = await http.get(url);
    

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Cart.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load cart");
    }
  }


}