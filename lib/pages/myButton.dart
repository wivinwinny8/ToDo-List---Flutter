import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class myButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  myButton({super.key,required this.name,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      child: Text(name,style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'OpenSans'),),
    );
  }
}
