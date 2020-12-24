import 'package:flutter/material.dart';
import 'dart:async';

import '../data_source.dart';

class FAQpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('FAQS'),
    ),
    body: ListView.builder(
      itemCount: DataSource.questionsAnswers.length,
      itemBuilder: (context , index){
      return ExpansionTile(
      title: DataSource.questionsAnswers[index]['question'],
      children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(DataSource.questionsAnswers[index]['answer'])),
      ],
      );
    }),
    );
  }
}
