import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerHandler;
  final String answerText;

  Answer(this.answerHandler , this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: answerHandler,
        child: Text(
          answerText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
