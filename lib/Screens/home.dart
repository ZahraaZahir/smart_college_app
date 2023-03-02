import 'package:flutter/material.dart';
import 'package:smart_college/data/courses_json.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: getBody());
  }

  Widget getBody() {
    return ListView(padding: const EdgeInsets.only(bottom: 5), children: [
      Column(
        children: [
          Column(
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/appbar.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            20,
                          ),
                          bottomLeft: Radius.circular(20))),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hello, \nZahraa Zahir",
                          style: TextStyle(fontSize: 27, color: Colors.white),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 1, 104, 132)),
                          child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search,
                              color: Colors.grey, size: 26),
                          suffixIcon: const Icon(Icons.mic,
                              color: Colors.lightBlue, size: 26),
                          labelText: "Search Your Courses",
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45))),
                    )
                  ]))
            ],
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Academic Courses',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'See More',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        child: Wrap(
            children: List.generate(courses.length, (index) {
          var data = courses[index];
          var size = MediaQuery.of(context).size;

          return Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 20),
            child: Container(
              child: Container(
                width: size.width * 0.6,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          offset: const Offset(0, 5))
                    ]),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: size.width * 0.4,
                          width: size.width * 0.6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              data['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 7,
                          left: 7,
                          child: Container(
                            width: 90,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              '${data['Semester']} Semester',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Text(
                        data['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                data['user_profile'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              width: 70,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data['user_name'],
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 13),
                              ),
                            ),
                          ),
                          Text(
                            '${data['credits']} Credits',
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        })),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Current Courses',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'See More',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      Column(
        children: List.generate(myCourses.length, (index) {
          var data = myCourses[index];
          var size = MediaQuery.of(context).size;
          return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 66, 92),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              height: size.width * .17,
                              width: size.width * .17,
                              child: ClipRRect(
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data['title'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Instructor: ${data['instructor_name']}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ))
                              ],
                            )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                width: size.width,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              Container(
                                width: data['percentage'] * 2.9,
                                height: 7,
                                decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.amber.withOpacity(0.5),
                                        blurRadius: 6,
                                        offset: const Offset(0, 3),
                                      )
                                    ]),
                              )
                            ],
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 50,
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${data['percentage']}%',
                              style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      )
                    ],
                  )));
        }),
      )
    ]);
  }
}
