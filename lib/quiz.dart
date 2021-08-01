import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';
import 'package:quiz/result.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _question = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Purple', 'score': 3},
        {'text': 'Red', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite car?',
      'answers': [
        {'text': 'City', 'score': 10},
        {'text': 'Auto', 'score': 5},
        {'text': 'Mehren', 'score': 3},
        {'text': 'Fx', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 1}
      ]
    },
  ];

  var _totalScore = 0;
  var _questionIndex = 0;

  void _restquiz(){
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });  
  }

  void _answerQuestion(String score) {
    var one = int.parse(score);
    _totalScore += one;
    //_totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _question.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PERSONALITY QUIZ GAME"),
      ),
      body: _questionIndex < _question.length
          ? Column(
              children: <Widget>[
                Question(
                  _question[_questionIndex]['questionText'].toString(),
                ),
                //  Question(
                //   (question[_questionIndex]['questionText'] as String),
                // ),
                ...(_question[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(
                      () => _answerQuestion(answer['score'].toString()),
                      answer['text'].toString());
                }).toList()
              ],
            )
          : Result(_totalScore,_restquiz),
    );
  }
}
