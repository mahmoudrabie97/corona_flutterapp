import 'package:flutter/material.dart';

import '../dataset.dart';

class QuestionAnswer extends StatelessWidget {
  static const routname = '/qanswer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQS'),
      ),
      body: ListView.builder(
          itemCount: questionanswer.length,
          itemBuilder: (ctx, i) {
            return Container(
              padding: EdgeInsets.all(10),
              child: ExpansionTile(
                title: Text(
                  questionanswer[i]['question'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Text(
                    questionanswer[i]['answer'],
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
