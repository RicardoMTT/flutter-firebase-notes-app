import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/controllers.dart';
import 'package:flutter_application_1/database.dart';
import 'package:get/get.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: appController.description,
              decoration: InputDecoration(
                  hintText: 'Description', labelText: 'Description'),
            ),
            TextField(
              controller: appController.title,
              decoration:
                  InputDecoration(hintText: 'Title', labelText: 'Title'),
            ),
            FlatButton(
                onPressed: () async {
                  await Database.addItem(
                    title: appController.title.text.toString(),
                    description: appController.description.text.toString(),
                  );
                  appController.title.text = "";
                  appController.description.text = "";
                  Get.back();
                },
                child: Text('Agregar'))
          ],
        ),
      ),
    );
  }
}
