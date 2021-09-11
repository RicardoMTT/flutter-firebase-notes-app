import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/controllers.dart';
import 'package:flutter_application_1/dashboard/dashboard.dart';
import 'package:flutter_application_1/database.dart';
import 'package:get/get.dart';

class StartForm extends StatefulWidget {
  final FocusNode focusNode;

  const StartForm({
    Key key,
    @required this.focusNode,
  }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<StartForm> {
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
                  controller: authController.uid,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'User ID',
                      hintText: 'Enter your unique identifier'),
                )
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
                  widget.focusNode.unfocus();
                  if (_loginInFormKey.currentState.validate()) {
                    Database.userUid = authController.uid.value.text.toString();

                    // Navigator.pushReplacementNamed(context, 'dashboard');
                    Get.to(DashboardScreen());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'Buscar Notas',
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
        ],
      ),
    );
  }
}
