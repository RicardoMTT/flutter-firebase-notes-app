import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  TextEditingController uid = TextEditingController();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  //SignUp

  TextEditingController usernameSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
}
