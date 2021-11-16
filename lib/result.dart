import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore , this.resetHandler);

  String get resultPhrase {
    var returnText;
    if (resultScore >= 25) {
      returnText = 'You are normal';
    } else if (resultScore >= 20) {
      returnText = 'You are kinda strange';
    } else {
      returnText = 'You are strange';
    }
    return returnText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(onPressed: resetHandler , child: Text('Restart Quiz'))
        ],
      ),
    );
  }
}
