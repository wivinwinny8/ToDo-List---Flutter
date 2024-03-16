// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:project/pages/database.dart';
import 'package:project/pages/dialogbox.dart';
import 'package:project/pages/todotile.dart';

class homepage extends StatefulWidget {
  homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final controller = TextEditingController();
  tododata db = tododata();
  var box = Hive.box('myBox');

  @override
  void initState() {
    if (box.get("TODOLIST") == null) {
      db.initialValues();
    } else {
      db.loadValues();
    }
    super.initState();
  }

  void checkbox(bool? value, int index) {
    setState(() {
      db.itemList[index][1] = !db.itemList[index][1];
    });
    db.updateValues();
  }

  void saveNewTask() {
    setState(() {
      db.itemList.add([controller.text, false]);
      controller.clear();
    });
    db.updateValues();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialogbox(
          controller: controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  void resetApp() {
    setState(() {
      db.clearValues();
      db.updateValues();
    });
  }

  Future<void> _handlerefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(179, 157, 219, 1),
      appBar: appbar(),
      body: LiquidPullToRefresh(
        onRefresh: _handlerefresh, 
        child: listview(),
        color: Colors.deepPurple,
        height: 200,
        backgroundColor: Colors.deepPurple[200],
        animSpeedFactor: 1,
        ),
      drawer: drawer(),
      floatingActionButton: fltbutton(),
    );
  }

  Drawer drawer() {
    return Drawer(
      backgroundColor: Colors.deepPurple[200],
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.developer_mode,
            size: 80,
          )),
          Text('@wivinwinny8',style: TextStyle(fontFamily: 'OpenSans'),),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              resetApp();
            },
            child: ListTile(
              leading: Icon(
                Icons.delete,
                size: 30,
              ),
              title: Text(
                'Reset',
                style: TextStyle(fontSize: 20,fontFamily: 'OpenSans'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton fltbutton() {
    return FloatingActionButton(
      onPressed: createNewTask,
      child: Icon(Icons.add),
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.itemList.removeAt(index);
    });
    db.updateValues();
  }

  ListView listview() {
    return ListView.builder(
      itemCount: db.itemList.length,
      itemBuilder: (context, index) {
        return todotile(
            name: db.itemList[index][0],
            status: db.itemList[index][1],
            delete: (context) => deleteTask(index),
            onChanged: (value) => checkbox(value, index));
      },
    );
  }

  AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: Text(
        'TO DO',
        style: TextStyle(color: Colors.white, fontSize: 28,fontFamily: 'OpenSans'),
      ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
