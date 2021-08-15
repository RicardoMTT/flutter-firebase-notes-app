import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/add.dart';
import 'package:flutter_application_1/dashboard/itemList.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dashboard'),
      ),
      body: ItemList(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(AddItem());
          }),
    );
  }
}
