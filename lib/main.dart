import 'package:flutter/material.dart';
import 'package:module_13_assignment/pages/add_product.dart';
import 'package:module_13_assignment/pages/product_list_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: AddProduct(),
    );
  }
}