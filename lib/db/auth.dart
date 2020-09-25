import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<User> googleSignIn();
}

class Auth implements BaseAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User> googleSignIn() async {
    // TODO: implement googleSignIn
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    try {
      User user = (await firebaseAuth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
