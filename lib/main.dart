import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

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
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Which one is the first search engine in internet?',
      'answers': [
        {'text': 'Google', 'score': 0},
        {'text': 'Archie', 'score': 1},
        {'text': 'Altavista', 'score': 0},
        {'text': 'WAIS', 'score': 0},
      ]
    },
    {
      'questionText':
          'Which of the following programming language is used to create programs like applets?',
      'answers': [
        {'text': 'C', 'score': 0},
        {'text': 'Python', 'score': 0},
        {'text': 'Java', 'score': 1},
      ]
    },
    {
      'questionText': 'Which of the following is not an operating system?',
      'answers': [
        {'text': 'Flutter', 'score': 1},
        {'text': 'Windows', 'score': 0},
        {'text': 'Linux', 'score': 0},
        {'text': 'macOS', 'score': 0},
      ]
    },
    {
      'questionText':
          'Which of the following is not a database management software?',
      'answers': [
        {'text': 'MySQL', 'score': 0},
        {'text': 'Oracle', 'score': 0},
        {'text': 'Sybase', 'score': 0},
        {'text': 'COBOL', 'score': 1},
        {'text': 'MongoDB', 'score': 0},
      ]
    },
    {
      'questionText': '1024 bit is equal to how many byte',
      'answers': [
        {'text': '1 byte', 'score': 0},
        {'text': '128 byte', 'score': 1},
        {'text': '32 byte', 'score': 0},
        {'text': '64 byte', 'score': 0},
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // creating a base page design, create a regular app page
      // Widget Tree:
      // Scaffold: it is will give a basic design and structure  to the app.
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: Text('Quiz Application.'),
          ),
          body: _questionIndex < _questions.length
              ? Container(
                  child: Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/blur.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
