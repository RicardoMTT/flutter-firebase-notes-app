import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app.dart';
import 'package:flutter_application_1/controllers/auth.dart';
import 'package:flutter_application_1/dashboard/dashboard.dart';
import 'package:flutter_application_1/firebase.dart';
import 'package:flutter_application_1/authentication/login.dart';
import 'package:flutter_application_1/item.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp().then((value) {
  //   runApp(MyApp());
  // });
  await Firebase.initializeApp();
  await initialization
      .then((value) => {Get.put(AuthController()), Get.put(AppController())});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'dashboard': (_) => DashboardScreen(),
      },
      // home: MyHomeScreen(),
    );
  }
}
