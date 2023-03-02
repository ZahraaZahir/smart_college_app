import 'package:flutter/material.dart';
import 'Screens/courses.dart';
import 'Screens/profile.dart';
import 'Screens/home.dart';
import 'package:flutter_svg/svg.dart';

class Nav_main extends StatefulWidget {
  const Nav_main({Key? key}) : super(key: key);

  @override
  _Nav_mainState createState() => _Nav_mainState();
}

class _Nav_mainState extends State<Nav_main> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getScreen() {
    List<Widget> screen = [
      HomeScreen(),
      CoursesScreen(),
      ProfileScreen(),
    ];
    return IndexedStack(index: screenIndex, children: screen);
  }

  Widget getFooter() {
    List bottomItems = [
      'images/home_icon.svg',
      'images/play_icon.svg',
      'images/user_icon.svg',
    ];
    return Container(
        height: 70,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black45, blurRadius: 30.0, offset: Offset(0, -10))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: Container(
            padding: EdgeInsets.all(21),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomItems.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomItems[index],
                        height: 17.5,
                        color:
                            screenIndex == index ? Colors.blue : Colors.black,
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
