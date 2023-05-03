import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "Which is the best No. 9 of all time?",
      "answerText": [
        {"text": "Muller", "score": 10},
        {"text": "Benzema", "score": 20},
        {"text": "Ronaldo", "score": 5},
        {"text": "Di Stefano", "score": 15},
      ]
    },
    {
      "questionText": "Who is GOAT?",
      "answerText": [
        {"text": "Cristiano Ronaldo", "score": 20},
        {"text": "Lionel Messi ", "score": 15},
        {"text": "Pele", "score": 10},
        {"text": "Maradona", "score": 5}
      ],
    },
    {
      "questionText": "which is best club?",
      "answerText": [
        {"text": "Real Madrid", "score": 20},
        {"text": "Liverpool", "score": 15},
        {"text": "Bayern Munich", "score": 10},
        {"text": "AC Milan", "score": 5},
      ],
    }
  ];
  // You Can add More Question above.

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      print("there are answers");
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("button pressed");
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
