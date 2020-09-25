import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp_flutter/commons/loading.dart';
import 'package:shopapp_flutter/db/users.dart';

import '../Provider/user_provider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserServices _userServices = UserServices();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  //TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  //String gender;
  bool hidePass = true;
  //String groupValue = "male";
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
                                  controller: _nameTextController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Full Name",
                                    icon: Icon(Icons.person_outline),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'The name field cannot be empty';
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
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    border: InputBorder.none,
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

//                    Padding(
//                      padding: EdgeInsets.all(8.0),
//                      child: Container(
//                        color: Colors.white.withOpacity(0.4),
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: ListTile(
//                                title: Text(
//                                  'male',
//                                  textAlign: TextAlign.end,
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                                trailing: Radio(
//                                  value: "male",
//                                  groupValue: groupValue,
//                                  onChanged: (e) => valueChanged(e),
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              child: ListTile(
//                                title: Text(
//                                  'female',
//                                  textAlign: TextAlign.end,
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                                trailing: Radio(
//                                  value: "female",
//                                  groupValue: groupValue,
//                                  onChanged: (e) => valueChanged(e),
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),

                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.5),
                              elevation: 0.0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    obscureText: hidePass,
                                    controller: _passwordTextController,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      border: InputBorder.none,
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
                                  trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
//                    Padding(
//                      padding: EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(10.0),
//                        color: Colors.white.withOpacity(0.5),
//                        elevation: 0.0,
//                        child: Padding(
//                          padding: EdgeInsets.only(left: 12.0),
//                          child: ListTile(
//                            title: TextFormField(
//                              obscureText: hidePass,
//                              controller: _confirmpasswordController,
//                              decoration: InputDecoration(
//                                border: InputBorder.none,
//                                hintText: "Confirm Password",
//                                icon: Icon(Icons.lock_outline),
//                              ),
//                              validator: (value) {
//                                if (value.isEmpty) {
//                                  return 'The password field cannot be empty';
//                                } else if (value.length < 6) {
//                                  return "the password has to be atleast 6 characters";
//                                } else if (_passwordTextController.text !=
//                                    value) {
//                                  return "The password need to be the same";
//                                }
//                                return null;
//                              },
//                            ),
//                            trailing: IconButton(
//                              icon: Icon(Icons.remove_red_eye),
//                              onPressed: () {
//                                setState(() {
//                                  hidePass = false;
//                                });
//                              },
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    if (!await user.signUp(
                                      _nameTextController.text,
                                      _emailTextController.text,
                                      _passwordTextController.text,
                                    ))
                                      _key.currentState.showSnackBar(SnackBar(
                                        content: Text("Sign up fail"),
                                      ));
                                  }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Sign Up",
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
                            padding: EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Text(
                                  'I already have an account',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "or sign in with",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      'images/google.png',
                                      width: 60.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
//                    Padding(
//                      padding: EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        color: Colors.red,
//                        elevation: 0.0,
//                        child: MaterialButton(
//                          onPressed: () {},
//                          minWidth: MediaQuery.of(context).size.width,
//                          child: Text(
//                            "Google",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 22.0),
//                          ),
//                        ),
//                      ),
//                    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
//
//  valueChanged(e) {
//    setState(() {
//      if (e == "male") {
//        groupValue = "male";
//        gender = e;
//      } else if (e == "female") {
//        groupValue = "female";
//        gender = e;
//      }
//    });
//  }

//  Future validateForm() async {
//    FormState formState = _formKey.currentState;
//    if (formState.validate()) {
//      formState.reset();
//      User user = _firebaseAuth.currentUser;
//      if (user == null) {
//        _firebaseAuth
//            .createUserWithEmailAndPassword(
//                email: _emailTextController.text,
//                password: _passwordTextController.text)
//            .then((user) => {
//                  _userServices.createUser({
//                    "username": _nameTextController.text,
//                    "email": _emailTextController.text,
//                    "userId": user.user.uid,
//                    "gender": gender,
//                    "password": _passwordTextController.text,
//                  })
//                })
//            .catchError((err) => {print(err.toString())});
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (context) => HomePage()));
//      }
//    }
//  }
}
