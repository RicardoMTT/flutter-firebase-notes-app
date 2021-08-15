import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('pedido');

    QuerySnapshot users = await collectionReference.get();
    print("USSS ${users.docs[0].data()['producto']}");
    String product = users.docs[0].data()['producto'];
    CollectionReference collectionReferenceProduct =
        FirebaseFirestore.instance.collection('producto');
    List<String> arreglo = [];
    collectionReferenceProduct
        .doc(product)
        .get()
        .then((value) => value.data().forEach((key, value) {
              print("KEY $key");
              arreglo.add(value);
              print("VA $value");
            }));

    print("ARREGLO $arreglo");
    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        print("WWWW");
        print(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('content'),
      ),
    );
  }
}
