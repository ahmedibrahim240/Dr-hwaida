import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/screens/courses/mycoursesdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CustomBottomNavigationBar.dart';

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
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 150,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              padding: EdgeInsets.symmetric(vertical: 20),
              children: [
                coursesgraidView(),
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

  coursesgraidView() {
    return ListView.builder(
      primary: false,
      itemCount: listCourses.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MyCoursesDetails(
                  courses: listCourses[index],
                ),
              ),
            );
          },
          child: corsesCard(index),
        );
      },
    );
  }

  corsesCard(int index) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(listCourses[index].courseImageUrl),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        getTranslated(context, "title") + ' : ',
                        style: AppTheme.heading.copyWith(color: customColor),
                      ),
                      Text('Course Name', style: AppTheme.subHeading),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        getTranslated(context, "lecturer") + ' : ',
                        style: AppTheme.heading.copyWith(color: customColor),
                      ),
                      Text('lecturer Name', style: AppTheme.subHeading),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
