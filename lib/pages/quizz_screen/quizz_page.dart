import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_interview_preparation/objects/Category.dart';
import 'package:flutter_interview_preparation/objects/Chapter.dart';
import 'package:flutter_interview_preparation/values/Home_Screen_Assets.dart';
import 'package:flutter_interview_preparation/values/Quizz_Screen_Fonts.dart';

import '../../values/Quizz_Screen_Assets.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Category> categories = [];
  int currentIndexQuizzItem = 0;
  late PageController _pageController;
  @override
  void initState() {
    categories = [
      Category('Algorithm0', listChapter, QuizScreenAssets.img_Algorithm),
      Category(
          'Data Structure', listChapter, QuizScreenAssets.img_DataStructure),
      Category('Language', listChapter, QuizScreenAssets.img_Language),
    ];
    currentIndexQuizzItem = 0;
    _pageController = PageController(viewportFraction: 0.75);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Popular Categories',style: QuizzScreenFont.titleAppBar,),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4),
            child: Column(
              children: [
                // Popular column bloc
                Column(
                  children: [
                    //Popular + ViewAll
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Popular Categories',
                          style: QuizzScreenFont.titleAppBar,
                        ),
                        const Spacer(),
                        // View all button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  categories = [...listCategory];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, left: 4, right: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xffC7EDE6),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View all',
                                      style: QuizzScreenFont.viewAll,
                                    ),
                                    const Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Category bloc
                    ...categories.map((item) {
                      return categoryBloc(item);
                    }).toList(),
                    //categoryBloc(),
                  ],
                ),
                // Quizz Column Bloc
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Quizz',
                          style: QuizzScreenFont.titleAppBar,
                        ),
                        const Spacer(),
                        // View all button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  categories = [...listCategory];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, left: 4, right: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xffC7EDE6),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View all',
                                      style: QuizzScreenFont.viewAll,
                                    ),
                                    const Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                // Quizz Item ListView Bloc
                SizedBox(
                  //padding: const EdgeInsets.only(left: 16),
                  height: 90,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndexQuizzItem = index;
                      });
                    },
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return itemQuizzCard('Aptitude');
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 10,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return buildIndicator(
                          index == currentIndexQuizzItem, size);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   Widget buildIndicator(bool isActive, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //width: isActive ? size.width * 1 / 5 : 15,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.lightBlue : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(2, 3),
            blurRadius: 2,
          ),
        ],
      ),
    );
  }

  // Widget buildIndicator(bool isActive, Size size) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 15),
  //     width: isActive ? size.width * 1 / 5 : 15,
  //     decoration: BoxDecoration(
  //       color: isActive ? Colors.lightBlue : Colors.grey,
  //       borderRadius: const BorderRadius.all(Radius.circular(5)),
  //       boxShadow: const [
  //         BoxShadow(
  //           color: Colors.black38,
  //           offset: Offset(2, 3),
  //           blurRadius: 2,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget itemQuizzCard(String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 4),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width * 2 / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(QuizScreenAssets.img_bg_quizz_item),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                width: MediaQuery.of(context).size.width * 2 / 3 - 40,
                top: 12,
                left: 4,
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: title,
                    style: QuizzScreenFont.titleCategory,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 4,
                child: Text(
                  '13 Quizz | 450 Questions',
                  style: QuizzScreenFont.textChapter,
                ),
              ),
              const Positioned(
                right: 10,
                top: 12,
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(width: 2,),
      ],
    );
  }

  Widget categoryBloc(Category category) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xffC5E5EF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 12, left: 12),
                        child: Text(
                          category.title!,
                          style: QuizzScreenFont.titleCategory,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 12,
                          left: 12,
                        ),
                        child: Text(
                          '${category.chapters!.length.toString()} chapters',
                          style: QuizzScreenFont.textChapter,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Image.asset(category.imagePath!),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
