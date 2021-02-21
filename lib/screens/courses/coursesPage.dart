import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/courses/coursesDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/coursesPageAppber.dart';

class CoursesPage extends StatefulWidget {
  final String title;

  const CoursesPage({Key key, @required this.title}) : super(key: key);
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 60,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                consultantAppBer(context, widget.title),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    widget.title,
                    style: AppTheme.heading.copyWith(
                      color: customColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                coursesgraidView(),
                SizedBox(height: 20),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CoursesDetails(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 50,
                            // height: 20,
                            child: Text(
                              listCourses[index].contant +
                                  listCourses[index].contant +
                                  listCourses[index].contant,
                              style: AppTheme.subHeading.copyWith(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            listCourses[index].title,
                            style: AppTheme.heading.copyWith(
                              color: customColor,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            date,
                            style: AppTheme.heading.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            listCourses[index].oldPrice + '\$',
                            style: AppTheme.heading.copyWith(
                              color: Colors.grey[500],
                              fontSize: 8,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            listCourses[index].newPrice + '\$',
                            style: AppTheme.heading.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      RatingStar(
                        rating: listCourses[index].rating,
                        isReadOnly: true,
                      ),
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
