import 'package:flutter/material.dart';
import 'package:flutter_interview_preparation/pages/home_screen/homepage.dart';
import 'package:flutter_interview_preparation/pages/home_screen/landing_screen.dart';
import 'package:flutter_interview_preparation/pages/home_screen/list_questions_screen.dart';
import 'package:flutter_interview_preparation/pages/profile_screen/profile_page.dart';
import 'package:flutter_interview_preparation/pages/quizz_screen/quizz_page.dart';
import 'package:flutter_interview_preparation/pages/search_screen/search_page.dart';
import 'package:flutter_interview_preparation/values/Home_Screen_Colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabFrame(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabFrame extends StatefulWidget {
  @override
  State<TabFrame> createState() => _TabFrameState();
}
 // nhat tan o day
class _TabFrameState extends State<TabFrame> {
  int _currentIndexBottomTab = 0;
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    SearchPage(),
    QuizzPage(),
    ProfilePage()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = HomePage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? Colors.blue : Colors.black,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = SearchPage();
                          currentTab = 1;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.black,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(
                                color:
                                    currentTab == 1 ? Colors.blue : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = QuizzPage();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.quiz,
                            color: currentTab == 2 ? Colors.blue : Colors.black,
                          ),
                          Text(
                            'Quizz',
                            style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3 ? Colors.blue : Colors.black,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blue : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
