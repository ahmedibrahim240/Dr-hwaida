import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Courses'),
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: coursesgraidView(),
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 350) / 1.6;
    final double itemWidth = size.width / 2;
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      primary: true,
      childAspectRatio: (itemWidth / itemHeight),
      shrinkWrap: true,
      children: List.generate(
        listCourses.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: InkWell(
              onTap: () {},
              child: Card(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                                      width: 145,
                                      // height: 20,
                                      child: Text(
                                        listCourses[index]
                                            .contant
                                            .substring(0, 50),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
