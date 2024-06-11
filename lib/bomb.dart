import 'package:flutter/material.dart';

class MyBomb extends StatelessWidget {
  final child;

  MyBomb({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: Colors.grey[800],
        child: Center(child: Text(child.toString())),
      ),
    );
  }
}
