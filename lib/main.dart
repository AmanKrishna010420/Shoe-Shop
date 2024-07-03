import 'package:flutter/material.dart';

import 'package:shop/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    @override
    Widget build(BuildContext context){
    return  const MaterialApp(
      title: "Shoe_Shop",
      home:HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}