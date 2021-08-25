import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(
    MyApp()); //shorter, running, when we have just one exprension on the body

// StatelessWidget: do not require mutable state, i.e., it is immutable. (megváltoztathatatlanok)
// We use StatefulWidgets, when we want to change something in the UI
// This class is recreated when the data is updated. This class can be rebuilt
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// State is a generic class, not reset
// setState is a function, which forces Flutter to re-render the UI.
// Call the build method again, and re-render the actual Widget, not the all pixels
class _MyAppState extends State<MyApp> {
  // In Dart all of the underscored names are private
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('answer 1');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your favourite color?',
        'answers': ['red', 'blue', 'green']
      },
      {
        'questionText': 'What is your favourite vehicle type?',
        'answers': ['Volvo', 'Audi', 'Other']
      },
      {
        'questionText': 'What is your favourite programming language?',
        'answers': ['c++', 'python', 'dart']
      }
    ];

    return MaterialApp(
      // creating a base page design, create a regular app page
      // Widget Tree:
      // Scaffold: it is will give a basic design and structure  to the app.
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text('Quiz Application.'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
