import 'package:flutter/material.dart';
import 'package:module_13_assignment/pages/add_product.dart';
import 'package:module_13_assignment/pages/product_list_screen.dart';
import 'package:module_13_assignment/pages/show_product.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ShowProduct(),
      /* To create a dynamic data use add product
       and show it another page with your requirement
       please consider it for the first time. to see the product click
        on the left bottom action button but at first
       you have to add product
       */
    );
  }
}