import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/models/coursesApi.dart';
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
    return FutureBuilder(
      future: CoursesApi.fetchAllCourses(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return (snapshot.data == null)
              ? Container()
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshot.data.length,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CoursesDetails(
                              courses: snapshot.data[index],
                            ),
                          ),
                        );
                      },
                      child: corsesCard(
                        courses: snapshot.data[index],
                      ),
                    );
                  },
                );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  corsesCard({Courses courses}) {
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
              image: NetworkImage(courses.courseImageUrl),
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
                          Text(
                            courses.title,
                            style: AppTheme.heading.copyWith(
                              color: customColor,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 50,
                            child: Text(
                              parseHtmlString(courses.contant),
                              style: AppTheme.heading.copyWith(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "total hours : ",
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                courses.total_time,
                                style: AppTheme.heading.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                getTranslated(context, "Price") + ' : ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                              Row(
                                children: [
                                  (courses.discount != '0')
                                      ? Text(
                                          courses.newPrice,
                                          style: AppTheme.heading.copyWith(
                                            color: Colors.grey[500],
                                            fontSize: 8,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(width: 5),
                                  Text(
                                    gitnewPrice(
                                          price: courses.newPrice,
                                          descaound: courses.discount,
                                        ) +
                                        '\$',
                                    style: AppTheme.heading.copyWith(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      RatingStar(
                        rating: double.parse(courses.rating),
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
