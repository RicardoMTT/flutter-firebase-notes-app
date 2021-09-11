import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/signup/signup.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/constants/controllers.dart';
import 'package:flutter_application_1/start/screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../start/screen.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;

  const LoginForm({
    Key key,
    @required this.focusNode,
  }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginInFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 30.0,
            ),
            child: Column(
              children: [
                TextField(
                  controller: authController.username,
                  decoration: InputDecoration(labelText: 'Correo'),
                ),

                TextField(
                  controller: authController.password,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),

                // CustomFormField(
                //   controller: authController.uid,
                //   focusNode: widget.focusNode,
                //   keyboardType: TextInputType.text,
                //   inputAction: TextInputAction.done,
                //   validator: (value) => Validator.validateUserID(
                //     uid: value,
                //   ),
                //   label: 'User ID',
                //   hint: 'Enter your unique identifier',
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            child: Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.orange,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  try {
                    User user = (await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: authController.username.text.toString(),
                                password:
                                    authController.password.text.toString()))
                        .user;
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('uid', user.uid);

                    Get.to(LoginStartScreen());
                    print(user);
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text(e.message),
                            actions: [
                              ElevatedButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  }
                }
                // widget.focusNode.unfocus();
                // if (_loginInFormKey.currentState.validate()) {
                //   Database.userUid = authController.uid.value.text.toString();

                //   Navigator.pushReplacementNamed(context, 'dashboard');

                //   // Navigator.of(context).pushReplacement(
                //   //   MaterialPageRoute(
                //   //     builder: (context) => DashboardScreen(),
                //   //   ),
                //   // );
                // }
                ,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          FlatButton(
              onPressed: () {
                Get.to(SignUpScreen());
              },
              child: Text('Sign up'))
        ],
      ),
    );
  }
}
