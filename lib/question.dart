import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // final tells this value never change after initialization in constructor

  Question(this.questionText); //contructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(
          10), // EdgeInseats is a special type, all is a constructor.
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28, color: Colors.blueAccent),
        textAlign: TextAlign.center,
      ),
    );
  }
}
