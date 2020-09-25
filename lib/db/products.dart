import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp_flutter/models/product.dart';

class ProductService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'products';
  Future<List<Product>> getFeaturedProducts() => _firestore
          .collection(collection)
          .where('featured', isEqualTo: true)
          .get()
          .then((snaps) {
        List<Product> featuredProducts = [];
        snaps.docs.map(//map will go through every snapshot
            (snapshot) => featuredProducts.add(Product.fromSnapshot(snapshot)));
        return featuredProducts;
      });

  Future<List<Product>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });

  Future<List<Product>> SearchProduct({String productName}) {
    //code to convert the first character to upper case
    String searchKey =
        productName[0].toUpperCase() + productName[1].substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + "\uf8ff"])
        .get()
        .then((result) {
          List<Product> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(Product.fromSnapshot(product));
          }
          return products;
        });
  }
}
