// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/pages/homepage.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
      theme: ThemeData(fontFamily: 'OpenSans'),
      //theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
