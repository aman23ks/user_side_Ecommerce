import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const ID = "id";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const BRAND = "brand";
  static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const SIZES = "Sizes";
  static const IMAGES = "images";
  static const FEATURED = "featured";
  static const SALE = "sale";
  static const DESCRIPTION = "description";
  static const COLOR = "colors";

  String _id;
  String _name;
  String _category;
  String _brand;
  double _price;
  int _quantity;
  List _sizes;
  List _images;
  List _color;
  bool _featured;
  bool _sale;
  String _description;

//getters
  String get id => _id;
  String get name => _name;
  String get category => _category;
  String get brand => _brand;
  double get price => _price;
  int get quantity => _quantity;
  List get sizes => _sizes;
  List get images => _images;
  List get color => _color;
  bool get featured => _featured;
  bool get sale => _sale;
  String get description => _description;

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _name = data[NAME];
    _id = data[ID];
    _brand = data[BRAND];
    _category = data[CATEGORY];
    _price = data[PRICE];
    _sizes = data[SIZES];
    _quantity = data[QUANTITY];
    _images = data[IMAGES];
    _featured = data[FEATURED];
    _sale = data[SALE];
    _description = data[DESCRIPTION];
    _color = data[COLOR];
  }
}
