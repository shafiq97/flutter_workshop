import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/Product.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body)['products'];
    return jsonResponse.map((product) => Product.fromJson(product)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
