import 'package:flutter/material.dart';
import 'package:shopapp_flutter/db/products.dart';
import 'package:shopapp_flutter/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _featureProduct = [];
  ProductService _productService = ProductService();
  List<Product> products = [];
  List<Product> productSearched = [];
  ProductProvider() {
    _getFeaturedProducts();
  }

  ProductProvider.initailize() {
    loadProducts();
  }

  List<Product> get featureProducts => _featureProduct;

  void _getFeaturedProducts() async {
    _featureProduct = await _productService.getFeaturedProducts();
    notifyListeners();
  }

  loadProducts() async {
    products = await _productService.getProducts();
    notifyListeners();
  }

  Future search({String productName}) async {
    productSearched =
        await _productService.SearchProduct(productName: productName);
    notifyListeners();
  }
}
