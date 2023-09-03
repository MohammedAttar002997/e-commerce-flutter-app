import 'package:flutter/material.dart';
import 'home/main_home_page.dart';

void main() {
  runApp(const FlutterEcommerceApp());
}

class FlutterEcommerceApp extends StatelessWidget {
  const FlutterEcommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
    );
  }
}
