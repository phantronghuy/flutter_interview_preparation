import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_interview_preparation/objects/Comment.dart';
import 'package:flutter_interview_preparation/objects/SortedBy.dart';
import 'package:flutter_interview_preparation/values/Home_Screen_Assets.dart';
import '../../objects/Questions.dart';
import '../../values/Home_Screen_Fonts.dart';

class QaDetailScreen extends StatefulWidget {
  const QaDetailScreen({Key? key}) : super(key: key);

  @override
  State<QaDetailScreen> createState() => _QaDetailScreenState();
}

class _QaDetailScreenState extends State<QaDetailScreen> {
  TextEditingController dropdownfieldController = TextEditingController();
  String sortedBySelected = SortedBy.array[0];

  @override
  Widget build(BuildContext context) {
    final Question question =
        ModalRoute.of(context)!.settings.arguments as Question;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: const Color(0xffEDEAEA),
          title: Text(
            'Detail Question',
            style: HomeScreenFonts.h1.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 4,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      offset: Offset(0.0, 3),
                      color: Colors.grey,
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            voteBloc(question),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 4),
                                child: titleAndTagBloc(question),
                              ),
                              Text(
                                question.content!,
                                style: HomeScreenFonts.content,
                              ),
                            ],
                          ),
                        ),
                        companyBloc(question),
                      ],
                    ),
                  ),
                ),
                //
                answersAndSortByBloc(question),
                commentBloc(question),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commentBloc(Question question) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Vote Comment Bloc
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //upvote comment bloc
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: const Icon(Icons.arrow_upward),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        question.upvote.toString(),
                        style: HomeScreenFonts.upvote,
                      ),
                    ),
                  ],
                ),
              ),
              //answer accepted bloc
              Container(
                margin: const EdgeInsets.only(left: 8, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    listComment[0].answerAccepted == true
                        ? const Icon(
                            Icons.beenhere,
                            color: Colors.green,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          //Content comment bloc
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12, left: 12),
                width: MediaQuery.of(context).size.width - 70,
                child: Text(
                  listComment[0].content!,
                  style: HomeScreenFonts.content,
                ),
              ),
              // Avatar Bloc
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 105, top: 10),
                          width: 30,
                          height: 30,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${listComment[0].account!.avatar}'),
                          ),
                        ),
                      ],
                    ),
                    //Details time, profile, bloc ...
                    Container(
                      padding: const EdgeInsets.only(left: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                listComment[0].timeComment!,
                                style: HomeScreenFonts.timePost,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: Text(
                                    listComment[0].account!.name!,
                                    style: HomeScreenFonts.nameAccount,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                listComment[0]
                                    .account!
                                    .numberOfPost!
                                    .toString(),
                                style: HomeScreenFonts.numberOfPost,
                              ),

                              //Medal
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                     margin:const EdgeInsets.only(right: 2,left: 2),
                                    child: Image.asset(
                                      HomeScreenAssets.goldMedal,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(
                                    listComment[0]
                                        .account!
                                        .numberOfGold!
                                        .toString(),
                                    style: HomeScreenFonts.numberOfPost,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    margin:const EdgeInsets.only(right: 2,left: 2),
                                    child: Image.asset(
                                      HomeScreenAssets.silverMedal,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(
                                    listComment[0]
                                        .account!
                                        .numberOfSilver!
                                        .toString(),
                                    style: HomeScreenFonts.numberOfPost,
                                  ),
                                  Container(
                                    margin:const EdgeInsets.only(right: 2,left: 2),
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      HomeScreenAssets.bronzeMedal,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(
                                    listComment[0]
                                        .account!
                                        .numberOfBronze!
                                        .toString(),
                                    style: HomeScreenFonts.numberOfPost,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget answersAndSortByBloc(Question question) {
    return Container(
      height: 37,
      decoration: const BoxDecoration(
        color: Color(0xffEDEAEA),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              '${question.comment} Answers',
              style: const TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 106, right: 5, top: 10),
                // ignore: prefer_const_constructors
                child: Text(
                  "Sort by:",
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.only(top: 10),
                height: 25,
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.2),
                ),
                child: DropdownButton<String>(
                  // To delete underline in dropdownbutton
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: sortedBySelected,
                  icon: const Icon(Icons.arrow_downward, size: 9),
                  elevation: 8,
                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      sortedBySelected = value!;
                    });
                  },
                  items: SortedBy.array
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: HomeScreenFonts.content.copyWith(
                          fontSize: 8,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget titleAndTagBloc(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title
        Container(
          padding: const EdgeInsets.only(top: 2, bottom: 4),
          width: MediaQuery.of(context).size.width * 9 / 15 - 5,
          child: Text(
            question.title!,
            style: HomeScreenFonts.titleQuestion,
          ),
        ),
        //Tags
        Row(
          children: [
            for (var item in question.tags!)
              Padding(
                padding: const EdgeInsets.only(right: 3, bottom: 2, top: 2),
                child: Container(
                    alignment: Alignment.centerLeft,
                    color: const Color(0xffDFE2EB),
                    child: Text(item, style: HomeScreenFonts.tagsName)),
              )
          ],
        ),
      ],
    );
  }

//Widget companybloc
  Widget companyBloc(Question question) {
    return SizedBox(
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Company Icon
          SizedBox(
            // padding: EdgeInsets.only(left: 15),
            child: Image.asset(
                alignment: Alignment.centerRight,
                fit: BoxFit.contain,
                width: 50,
                height: 40,
                question.company!),
          ),
          //TimePost
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              question.time!,
              style: const TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Widget VoteBloc
  Widget voteBloc(Question question) {
    return Container(
      padding: const EdgeInsets.only(left: 4),
      // color:Colors.red,
      width: MediaQuery.of(context).size.width / 6.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vote
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
            child: Row(
              children: [
                Icon(question.upvote! > 0
                    ? Icons.arrow_upward
                    : Icons.arrow_downward),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    question.upvote.toString(),
                    style: HomeScreenFonts.upvote,
                  ),
                ),
              ],
            ),
          ),
          // Comment
          Row(
            children: [
              const Icon(Icons.comment),
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 2),
                child: Text(
                  question.comment.toString(),
                  style: HomeScreenFonts.comment,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
