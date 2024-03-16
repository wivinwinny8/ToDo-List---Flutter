import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/pages/myButton.dart';
import 'package:project/pages/todotile.dart';

class dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  dialogbox({super.key, required this.controller,required this.onSave,required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Container(
        height: 130,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: TextStyle(fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                  hintText: 'Add new task...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                myButton(name: "Save", onPressed: onSave,),
                SizedBox(
                  width: 20,
                ),
                myButton(name: "Cancel", onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
