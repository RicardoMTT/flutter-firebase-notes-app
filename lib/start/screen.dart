import 'package:flutter/material.dart';
import 'package:flutter_application_1/start/form.dart';

class LoginStartScreen extends StatefulWidget {
  const LoginStartScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginStartScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      // Text(
                      //   'FlutterFire',
                      //   style: TextStyle(
                      //     color: Colors.orange,
                      //     fontSize: 40,
                      //   ),
                      // ),
                      // Text(
                      //   'CRUD',
                      //   style: TextStyle(
                      //     color: Colors.orange,
                      //     fontSize: 40,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                StartForm(focusNode: _uidFocusNode),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
