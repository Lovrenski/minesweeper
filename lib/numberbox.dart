import 'package:flutter/material.dart';

class MyNumberBox extends StatelessWidget {
  final child;
  bool revealed;

  MyNumberBox({this.child, required this.revealed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: revealed ? Colors.grey[400] : Colors.grey,
        child: Center(child: Text(child.toString())),
      ),
    );
  }
}
