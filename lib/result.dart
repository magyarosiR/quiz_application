import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultMessage {
    var resultText = 'You did it! Your score: $resultScore. ';
    if (resultScore < 3) {
      resultText = 'Try again. Your score: $resultScore.';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultMessage,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: resetQuiz, child: Text("Try again"))
        ],
      ),
    );
  }
}
