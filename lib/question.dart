import 'package:flutter/material.dart';

class Question extends StatelessWidget {
//const  Question({ Key? key }) : super(key: key);

  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
