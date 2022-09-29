import 'package:flutter_interview_preparation/values/Home_Screen_Assets.dart';

class Question{
  int? upvote;
  int? comment;
  String? title;
  List<String>? tags=[];
  String? content;
  String? company;
  String? time;


  Question(this.upvote,this.comment,this.title,this.tags,this.content,this.company,this.time);
  @override
  String toString() {
    return '$title';
  }

}
List<Question> listQuestion=[
  Question(12,4,"Remove duplicateRemove duplicateRemove duplicateRemove duplicateRemove duplicateRemove duplicateRemove duplicate",['algorithms','string'],'This is contentThis is contentThis is contentThis is contentTs',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,45,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is contentThis is contentThis is contentThis is contentTs',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,45,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is contentThis is contentThis is contentThis is contentTs',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,45,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
  Question(12,4,"Remove duplicate",['algorithms','string'],'This is content',HomeScreenAssets.lgLogo,'10/10/2022'),
];