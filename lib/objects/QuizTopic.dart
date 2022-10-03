import 'package:flutter_interview_preparation/objects/Quiz.dart';

class QuizTopic{
  String? topic;
  List<Quiz>? listQuiz;
  bool? favourite;
  QuizTopic(this.topic,this.listQuiz,this.favourite);
}
List<QuizTopic> listQuizTopic=[
  QuizTopic('HTML & XML', listQuiz, true),
  QuizTopic('HTML & XML', listQuiz, false),
  QuizTopic('HTML & XML', listQuiz, true),
];
