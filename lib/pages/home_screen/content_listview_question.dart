import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_interview_preparation/objects/Questions.dart';

class ContentListQuestions extends StatelessWidget {
  const ContentListQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listQuestion.length,
      itemBuilder: (context,index){
        Question q = listQuestion[index];
        return ListTile(
          title: Text(q.toString()),
        );
      },
    );
  }
}