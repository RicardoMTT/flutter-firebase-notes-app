import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/signup/signup-form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'FlutterFire',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        'CRUD',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SignUpForm(focusNode: _uidFocusNode),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
