import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/login-form.dart';
import 'package:flutter_application_1/dashboard/dashboard.dart';
import 'package:flutter_application_1/start/screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();
  @override
  void initState() {
    initSharedPreference();
    super.initState();
  }

  initSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    print("TAKE $uid");
    if (uid != null) {
      Get.to(LoginStartScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'FlutterFire',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Note app',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  LoginForm(focusNode: _uidFocusNode),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
