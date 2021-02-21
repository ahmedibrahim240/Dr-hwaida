import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/courses/mycoursesdetails.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'coursesPage.dart';

class ChosesCourses extends StatefulWidget {
  @override
  _ChosesCoursesState createState() => _ChosesCoursesState();
}

class _ChosesCoursesState extends State<ChosesCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 150,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: [
                coursesSilder(context: context, coursesList: listCourses),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    statusConrainer(
                      imgUrl: 'lib/images/engaged.png',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                CoursesPage(title: 'Courses Of Couples'),
                          ),
                        );
                      },
                      title: 'Couples',
                    ),
                    SizedBox(width: 10),
                    statusConrainer(
                      imgUrl: 'lib/images/single.png',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                CoursesPage(title: 'Courses Of Single'),
                          ),
                        );
                      },
                      title: 'Single',
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    statusConrainer(
                      imgUrl: 'lib/images/married.png',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                CoursesPage(title: 'Courses Of Marrige'),
                          ),
                        );
                      },
                      title: 'Marrige',
                    ),
                    SizedBox(width: 10),
                    statusConrainer(
                      imgUrl: 'lib/images/family.png',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                CoursesPage(title: 'Courses Of Family'),
                          ),
                        );
                      },
                      title: 'Father / Mother',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  InkWell statusConrainer({Function onTap, String imgUrl, String title}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgUrl),
              ),
            ),
          ),
          Text(
            title,
            style: AppTheme.heading.copyWith(
              color: customColor,
            ),
          )
        ],
      ),
    );
  }

  Container coursesSilder({BuildContext context, List<Courses> coursesList}) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlayInterval: Duration(seconds: 2),
              autoPlay: true,
              // reverse: widget.reverse,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
            items: coursesList
                .map(
                  (items) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => MyCoursesDetails(
                            courses: items,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    image: DecorationImage(
                                      image: AssetImage(items.courseImageUrl),
                                      //  NetworkImage(
                                      //   items,
                                      // ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(height: 40),
                                        Text(
                                          items.title,
                                          style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          items.contant.substring(0, 25),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
