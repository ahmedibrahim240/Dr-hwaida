import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/mycoursescard.dart';

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  String contant =
      'We make it easy, fast and affordable to send SMS marketing We make it easy, fast and affordable to send SMS marketing';
  String title = 'Dr/ Ahmed Ibrahim';
  String date = '12 May 2021';
  String oldPrice = '300';
  String newPrice = '255';
  String courseImageUrl = 'lib/images/person.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: ''),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          Text(
            'Courses',
            style: AppTheme.heading.copyWith(
              color: customColor,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: listCourses.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  CustomMyCoutsesCard(
                    courses: listCourses[index],
                    onTap: () {
                      print('card=>$index');
                    },
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
