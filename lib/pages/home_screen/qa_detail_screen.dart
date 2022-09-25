import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../values/Home_Screen_Fonts.dart';

class QaDetailScreen extends StatefulWidget {
  const QaDetailScreen({Key? key}) : super(key: key);

  @override
  State<QaDetailScreen> createState() => _QaDetailScreenState();
}

class _QaDetailScreenState extends State<QaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:
          AppBar(
            backgroundColor: const Color(0xffEDEAEA),
            title: Text(
              'Detail Question',
              style: HomeScreenFonts.h1
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
            ),
            // leading:  IconButton(
            //   icon:  Icon(Icons.arrow_back, color: Colors.black),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
          ),

        body: Padding(
          padding: EdgeInsets.only(left: 4,top: 4,right: 4),
          child: Container(
            color:Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'Quê hương em là một ngôi làng nhỏ phía bên bờ dòng sông Hồng. Nơi đây có cánh đồng lúa rộng thẳng cánh cò bay, có vườn cây trĩu ăn quả ngọt, có những luống rau xanh mướt mắt…Chiều chiều, bên bờ đê, lại bay lên những cánh diều của lũ trẻ đủ hình thù màu sắc. Thấp thoáng xa xa những hơi khói mỏng manh bay lên từ căn bếp nhỏ. Vọng lại văng vẳng tiếng cười, tiếng nói của những gia đình nhỏ mà ấm áp. Ôi! Sao mà bình yên đến thế!Quê hương em là một ngôi làng nhỏ phía bên bờ dòng sông Hồng. Nơi đây có cánh đồng lúa rộng thẳng cánh cò bay, có vườn cây trĩu ăn quả ngọt, có những luống rau xanh mướt mắt…Chiều chiều, bên bờ đê, lại bay lên những cánh diều của lũ trẻ đủ hình thù màu sắc. Thấp thoáng xa xa những hơi khói mỏng manh bay lên từ căn bếp nhỏ. Vọng lại văng vẳng tiếng cười, tiếng nói của những gia đình nhỏ mà ấm áp. Ôi! Sao mà bình yên đến thế!Quê hương em là một ngôi làng nhỏ phía bên bờ dòng sông Hồng. Nơi đây có cánh đồng lúa rộng thẳng cánh cò bay, có vườn cây trĩu ăn quả ngọt, có những luống rau xanh mướt mắt…Chiều chiều, bên bờ đê, lại bay lên những cánh diều của lũ trẻ đủ hình thù màu sắc. Thấp thoáng xa xa những hơi khói mỏng manh bay lên từ căn bếp nhỏ. Vọng lại văng vẳng tiếng cười, tiếng nói của những gia đình nhỏ mà ấm áp. Ôi! Sao mà bình yên đến thế!Quê hương em là một ngôi làng nhỏ phía bên bờ dòng sông Hồng. Nơi đây có cánh đồng lúa rộng thẳng cánh cò bay, có vườn cây trĩu ăn quả ngọt, có những luống rau xanh mướt mắt…Chiều chiều, bên bờ đê, lại bay lên những cánh diều của lũ trẻ đủ hình thù màu sắc. Thấp thoáng xa xa những hơi khói mỏng manh bay lên từ căn bếp nhỏ. Vọng lại văng vẳng tiếng cười, tiếng nói của những gia đình nhỏ mà ấm áp. Ôi! Sao mà bình yên đến thế!'),
                   Icon(Icons.abc),   
                ],
              ),
            ),
          ),
        ),
    );
  }
  // Widget build(BuildContext context) {
  //    return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: Size.fromHeight(40.0),
  //       child: Padding(
  //         padding: EdgeInsets.only(bottom: 10),
  //         child: AppBar(
  //           title: Text('ProfilePage'),
  //         ),
  //       ),
  //     ),
  //     body: Center(
  //       child:Text('Profile Screen',style: TextStyle(fontSize:40 ),),
  //     ),
  //   );
  // }
}
