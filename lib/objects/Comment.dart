import 'package:flutter_interview_preparation/objects/Account.dart';

class Comment{
  int? upvote;
  bool? answerAccepted;
  String? content;
  String? timeComment;
  Account? account;
  Comment(this.upvote,this.answerAccepted,this.content,this.timeComment,this.account);
}
List<Comment> listComment=[
  Comment(12, true, 'Phan Trong Huy dang cap pro 33Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123Phan Trong Huy dang cap pro 123', 'answered Dec 15 2021 at 13:45', listAccount[0]),
];