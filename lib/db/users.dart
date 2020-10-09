import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp_flutter/models/cart_item.dart';
import 'package:shopapp_flutter/models/user_model.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String collection = "users";

  createUser(Map data) {
    _firestore.collection(collection).doc(data["uid"]).set(data);
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  void addToCart({String userID, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userID).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userID, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userID).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}
