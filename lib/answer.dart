import 'package:flutter/material.dart';
import './main.dart';

class Answer extends StatelessWidget {
  var onPrsName;
  Answer(this.onPrsName);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Answer'),
        color: Colors.blueGrey,
        onPressed: onPrsName,
      ),
    );
  }
}
