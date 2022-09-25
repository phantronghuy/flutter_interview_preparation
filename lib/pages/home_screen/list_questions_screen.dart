
import 'package:flutter/material.dart';
import 'package:flutter_interview_preparation/values/Home_Screen_Assets.dart';
import 'package:flutter_interview_preparation/values/Home_Screen_Colors.dart';
import 'package:flutter_interview_preparation/values/Home_Screen_Fonts.dart';
import '../../objects/Questions.dart';

class ListQuetionsScreen extends StatefulWidget {
  const ListQuetionsScreen({Key? key}) : super(key: key);

  @override
  State<ListQuetionsScreen> createState() => _ListQuetionsScreenState();
}

class _ListQuetionsScreenState extends State<ListQuetionsScreen> {
  static int isArticleTab = 0;
  // ignore: non_constant_identifier_names
  List<Question> display_list_question = List.from(listQuestion);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(HomeScreenAssets.banner),
            ),
            Expanded(
              flex: 1,
              child: tabViewContent(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffEDEAEA),
                child: searchPart(),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: const Color(0xffEDEAEA),
                child: isArticleTab == 0
                    ? contentListArticles()
                    : contentListQuestions(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabViewContent() {
    return DefaultTabController(
      length: 2,
      child: Material(
        color: HomeScreenColors.primaryColor,
        child: TabBar(
          onTap: (index) {
            onTapHandle(index);
          },
          // indicatorColor: Colors.white,
          //indicatorWeight: 1,
          tabs: [
            Tab(
              child: Text(
                'Articles',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Questions & Answers',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchPart() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8.0, top: 2.0),
          child: Text(
            'All Questions',
            style: HomeScreenFonts.h1
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Container(
            //   width: 55,
            //   //color: Colors.red,
            //   child: Text(
            //     'Company',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 10),
            //   ),
            // ),
            Container(  
              width: 230,
              height: 50,
              padding: EdgeInsets.only(top: 15),
              //color: Colors.red,
              child: TextField(
                maxLines: 1,
                style: TextStyle(color: Colors.black,fontSize: 14),
                decoration: InputDecoration(
                  // filled: true,
                  //fillColor: Color(0xff302360),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: const TextStyle(fontSize: 12),
                  hintText: 'Search Company',
                  prefixIcon: const Icon(Icons.search,size: 17),
                  prefixIconColor: Colors.purple.shade900,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  // Widget contentListQuestions() {
  //   return ListView.builder(
  //     itemCount: display_list_question.length,
  //     itemBuilder: (context, index) {
  //       Question q = listQuestion[index];
  //       return ListTile(
  //         contentPadding: const EdgeInsets.all(8),
  //         title: Text(display_list_question[index].title!),
  //         subtitle: Text(display_list_question[index].content!),
  //         trailing: Text(display_list_question[index].company!),
  //       );
  //     },
  //   );
  // }

  Widget contentListQuestions() {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: Offset(0.0,3),
                  color: Colors.grey,
                ),
              ]
            ),
            width: MediaQuery.of(context).size.width,
            margin:const EdgeInsets.only(bottom: 5),
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
                        padding: const EdgeInsets.only(
                             top: 3.0, bottom: 12.0),
                        child: Row(
                          children: [
                            Icon(display_list_question[index].upvote! > 0
                                ? Icons.arrow_upward
                                : Icons.arrow_downward),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                display_list_question[index]
                                    .upvote
                                    .toString(),
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
                            padding:
                                const EdgeInsets.only(left: 5, bottom: 2),
                            child: Text(
                              display_list_question[index].comment.toString(),
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
                  padding:
                      const EdgeInsets.only(left: 2.0, top: 1, bottom: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Title
                      Container(
                        padding: const EdgeInsets.only(top: 1, bottom: 4),
                        width: MediaQuery.of(context).size.width * 9 / 15-5,
                        child: Text(
                          display_list_question[index].title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //Tags
                      Row(
                        children: [
                          for (var item in display_list_question[index].tags!)
                            Padding(
                              padding:const EdgeInsets.only(right: 3, bottom: 2),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  color:const Color(0xffDFE2EB),
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            )
                        ],
                      ),
                      //Content
                      Container(
                        width: MediaQuery.of(context).size.width * 9 / 15-5,
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
                            display_list_question[index].company!),
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
          );
        },
        childCount: display_list_question.length,
      ),
    );
  }

  Widget contentListArticles() {
    return ListView.builder(
      itemCount: listQuestion.length,
      itemBuilder: (context, index) {
        Question q = listQuestion[index];
        return ListTile(
          title: Text(q.title!),
        );
      },
    );
  }

  void onTapHandle(int index) {
    setState(() {
      {
        // ignore: avoid_print
        print('Index: $index , isArticleTab: $isArticleTab');
        if (index != 0) {
          isArticleTab = 1;
        } else {
          isArticleTab = 0;
        }
      }
    });
  }
}
