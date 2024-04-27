import 'dart:convert';

import 'package:http/http.dart' as http;
import './product_model.dart';

class ProductsApiService {
  static const String baseUrl = 'https://dummyjson.com/products/categories';
  static const String categoriesEndpoint = 'products/categories';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed to load products: ${response.statusCode}'); // Throw exception for error handling
    }
  }
}