import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp_flutter/models/cart_item.dart';

class UserModel {
  static const ID = 'userId';
  static const EMAIL = 'email';
  static const NAME = 'name';
  static const PASSWORD = 'password';
  static const CART = 'cart';

  String _id;
  String _email;
  String _password;
  String _name;

  String get id => _id;
  String get email => _email;
  String get password => _password;
  String get name => _name;

  List<CartItemModel> cart;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _id = data[id];
    _email = data[EMAIL];
    _password = data[PASSWORD];
    _name = data[NAME];
    cart = _convertCartItems(data[CART] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
