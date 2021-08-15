import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/controllers.dart';

class SignUpForm extends StatefulWidget {
  final FocusNode focusNode;

  const SignUpForm({
    Key key,
    @required this.focusNode,
  }) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
              bottom: 24.0,
            ),
            child: Column(
              children: [
                TextField(
                  controller: authController.usernameSignUp,
                ),

                TextField(
                  controller: authController.passwordSignUp,
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
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: authController.usernameSignUp.text
                              .toString()
                              .trim(),
                          password: authController.passwordSignUp.text
                              .toString()
                              .trim())
                      .then((result) {
                    print('result $result');
                  }).catchError((err) {
                    print(err.message);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text(err.message),
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
                  });
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
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
