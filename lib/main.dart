import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 4},
        {'text': 'Hamster', 'score': 7}
      ]
    },
    {
      'questionText': 'What\'s your favourite type of food?',
      'answers': [
        {'text': 'Sweet', 'score': 7},
        {'text': 'Savoury', 'score': 4},
        {'text': 'Cheesy', 'score': 1},
        {'text': 'Vegetables', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Pink', 'score': 7},
        {'text': 'Green', 'score': 4},
        {'text': 'B&W', 'score': 1},
        {'text': 'Orange', 'score': 10}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
