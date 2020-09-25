import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = 'userId';
  static const EMAIL = 'email';
  static const NAME = 'name';
  static const PASSWORD = 'password';

  String _id;
  String _email;
  String _password;
  String _name;

  String get id => _id;
  String get email => _email;
  String get password => _password;
  String get name => _name;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _id = data[ID];
    _email = data[EMAIL];
    _password = data[PASSWORD];
    _name = data[NAME];
  }
}
