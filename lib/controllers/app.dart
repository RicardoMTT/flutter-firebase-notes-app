import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();

  TextEditingController descriptionEdit = TextEditingController();
  TextEditingController titleEdit = TextEditingController();
}
