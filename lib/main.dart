import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_two_anas_qunibi/features/assets/views/assets_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YouTube Player with GetX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AssetsView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
