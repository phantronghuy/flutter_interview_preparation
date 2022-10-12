import 'package:flutter/material.dart';
import 'package:flutter_interview_preparation/objects/Company.dart';

import '../../objects/Account.dart';
import '../../objects/Articles.dart';
import '../../objects/Comment.dart';
import '../../objects/Questions.dart';
import '../../values/Home_Screen_Fonts.dart';
import '../home_screen/article_detail_screen.dart';
import '../home_screen/qa_detail_screen.dart';

class DetailCompany extends StatefulWidget {
  const DetailCompany({Key? key}) : super(key: key);

  @override
  State<DetailCompany> createState() => _DetailCompanyState();
}

class _DetailCompanyState extends State<DetailCompany> {

  @override
  Widget build(BuildContext context) {
    final Company company =
    ModalRoute.of(context)!.settings.arguments as Company;

    Column articlePart() {
      List _post = <ArticlePost>[];
      _post
        ..add(new ArticlePost(
            title: 'What clothes we should use in the interview day',
            detail:
            'Clothes are one of the easiest impressive point to the interviewers',
            bookmark: true,
            favorite: 1412,
            time: '28/07/2022',
            comment: listComment,
            account: listAccount[1],
            love: false))
        ..add(new ArticlePost(
            title: 'OOP is a must for a C++ developer',
            detail:
            'Most of us have studied Object-Oriented Programming at the university',
            bookmark: false,
            favorite: 1412,
            time: '28/07/2022',
            comment: listComment,
            account: listAccount[1],
            love: false))
        ..add(new ArticlePost(
            title: 'Apple SDE Sheet: Interview Question & Answer',
            detail:
            'Apple is obe of the worlds favorite tech brand, holding a tight spot as one of the tech Big Four companies',
            bookmark: true,
            favorite: 2871,
            time: '28/07/2022',
            comment: listComment,
            account: listAccount[1],
            love: false));

      return Column(
          children: List.generate(_post.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: false,
                    builder: (context) => ArticleDetailScreen(),
                    settings: RouteSettings(
                      arguments: _post[index],
                    ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(0.0, 3),
                    color: Colors.grey,
                  ),
                ]),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.only(bottom: 5, left: 10),
                          child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: _post[index].title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 3),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: _post[index].detail,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          _post[index].bookmark
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: Colors.blue,
                          size: 24,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                _post[index].favorite.toString(),
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          visible: _post[index].bookmark,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            );
          }));
    }

    Column qaPart() {
      List<Question> display_list_question = List.from(listQuestion);
      return Column(
          children: List.generate(3, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: false,
                    builder: (context) => QaDetailScreen(),
                    settings: RouteSettings(
                      arguments: display_list_question[index],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(0.0, 3),
                    color: Colors.grey,
                  ),
                ]),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    //Vote bloc
                    Container(
                      padding: const EdgeInsets.only(left: 4),
                      // color:Colors.red,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Vote
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0, bottom: 12.0),
                            child: Row(
                              children: [
                                Icon(display_list_question[index].upvote! > 0
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    display_list_question[index].upvote.toString(),
                                    style: const TextStyle(
                                      fontSize: 11,
                                    ),
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
                                  display_list_question[index]
                                      .comment!
                                      .length
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Content bloc
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, top: 1, bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          Container(
                            padding: const EdgeInsets.only(top: 1, bottom: 4),
                            width: MediaQuery.of(context).size.width * 9 / 15 - 5,
                            child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: display_list_question[index].title!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // child: Text(
                            //   display_list_question[index].title!,
                            //   style: const TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ),
                          //Tags
                          Row(
                            children: [
                              for (var item in display_list_question[index].tags!)
                                Padding(
                                  padding: const EdgeInsets.only(right: 3, bottom: 2),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    color: const Color(0xffDFE2EB),
                                    child: RichText(
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      text: TextSpan(
                                        text: item,
                                        style: const TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    // child: Text(
                                    //   item,
                                    //   style: const TextStyle(
                                    //     color: Colors.lightBlue,
                                    //     fontSize: 12,
                                    //     fontWeight: FontWeight.w500,
                                    //   ),
                                    // ),
                                  ),
                                )
                            ],
                          ),
                          //Content
                          Container(
                            width: MediaQuery.of(context).size.width * 9 / 15 - 5,
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            //width: 150,
                            child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: display_list_question[index].content!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Company bloc
                    SizedBox(
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
                                height: 50,
                                company.logo),
                          ),
                          //TimePost
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              display_list_question[index].time!,
                              style: const TextStyle(
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }));
    }


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Text(
            'All about '+company.name,
            style: HomeScreenFonts.h1.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration:
            const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(0.0, 3),
                color: Colors.grey,
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 9-20,
                    width: MediaQuery.of(context).size.height / 9 +30,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black),
                    child: Center(

                        child: Image(
                          image: AssetImage(company.logo),
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width / 10,


                        )),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child:  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: company.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'Article',
            style: HomeScreenFonts.h1
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          articlePart(),

          SizedBox(height: 10,),

          Text(
            'Questions And Answers',
            style: HomeScreenFonts.h1
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          qaPart()
        ],
      ),
    );
  }
}
