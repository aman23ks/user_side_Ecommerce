import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp_flutter/Pages/Home.dart';
import 'package:shopapp_flutter/Pages/signup.dart';
import 'package:shopapp_flutter/Provider/user_provider.dart';
import 'package:shopapp_flutter/commons/loading.dart';
import 'package:shopapp_flutter/db/auth.dart';
import 'package:shopapp_flutter/db/users.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  Auth auth = Auth();
  UserServices _userServices = UserServices();

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    isSignedIn();
//  }
//
//  void isSignedIn() async {
//    setState(() {
//      loading = true;
//    });
//
//    if (firebaseAuth.currentUser != null) {
//      setState(() {
//        isLoggedIn = true;
//      });
//    }
//
//    if (isLoggedIn) {
//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => HomePage()));
//    }
//    setState(() {
//      loading = false;
//    });
//  }

  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : Stack(
              children: <Widget>[
                Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.black.withOpacity(0.8),
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'images/chillies.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.5),
                              elevation: 0.0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.email),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.5),
                              elevation: 0.0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'The password field cannot be empty';
                                    } else if (value.length < 6) {
                                      return "the password has to be atleast 6 characters";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
//                            setState(() {
//                                     isSignedIn();
//
//                            });
                                  if (_formKey.currentState.validate()) {
                                    if (!await user.signIn(
                                        _emailTextController.text,
                                        _passwordTextController.text))
                                      _key.currentState.showSnackBar(SnackBar(
                                        content: Text("Sign in fail"),
                                      ));
                                  }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              child: MaterialButton(
                                child: Image.asset(
                                  'images/google.png',
                                  width: 60.0,
                                ),
                                onPressed: () async {
                                  User user = await auth.googleSignIn();
                                  if (user == null) {
                                    _userServices.createUser({
                                      "name": user.displayName,
                                      "photo": user.photoURL,
                                      "email": user.email,
                                      "userId": user.uid,
                                    });
                                  }
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Forgot Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()));
                                  },
                                  child: Center(
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
