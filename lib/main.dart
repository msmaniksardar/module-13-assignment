import 'package:flutter/material.dart';
import 'package:module_13_assignment/pages/card_design.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: CardDesign(),
    );
  }
}