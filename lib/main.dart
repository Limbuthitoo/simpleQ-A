import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomquiz/bindings/quiz_binding.dart';
import 'package:randomquiz/view/home.dart';
import 'package:randomquiz/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
