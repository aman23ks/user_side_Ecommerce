import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Fav {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = "favourite";
  void createFav(bool value) {
    var id = Uuid();
    String favId = id.v1();
    _firestore.collection(ref).doc(favId).set({"favourite": value});
  }
}
