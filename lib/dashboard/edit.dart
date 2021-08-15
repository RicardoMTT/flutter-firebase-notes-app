import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/controllers.dart';
import 'package:flutter_application_1/database.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final String title;
  final String description;
  final String id;

  const EditScreen({Key key, this.title, this.description, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    appController.description = TextEditingController(text: description);
    appController.title = TextEditingController(text: title);
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () async {
                await Database.deleteItem(docId: id);
                Future.delayed(Duration(milliseconds: 200));
                Get.back();
              },
              child: Icon(Icons.remove))
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: appController.title,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: appController.description,
            decoration: InputDecoration(labelText: 'Descripcion'),
          ),
          FlatButton(
              onPressed: () async {
                await Database.updateItem(
                    title: appController.title.text.toString(),
                    description: appController.description.text.toString(),
                    docId: id);

                Get.back();
              },
              child: Text('Actualizar'))
        ],
      ),
    );
  }
}
