import 'package:flutter/material.dart';
import './main.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        textColor: Colors.black,
        color: Colors.greenAccent,
        onPressed: selectHandler,
      ),
    );
  }
}
