import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../CustomBottomNavigationBar.dart';
import 'components/videoscreens.dart';

class MyCoursesDetails extends StatefulWidget {
  final Courses courses;

  const MyCoursesDetails({Key key, @required this.courses}) : super(key: key);
  @override
  _MyCoursesDetailsState createState() => _MyCoursesDetailsState();
}

class _MyCoursesDetailsState extends State<MyCoursesDetails> {
  int lecTapped = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ChewieVideo(),
                      ),
                      courseDetail(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            lecTapped = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'lecture',
                              style: AppTheme.subHeading.copyWith(
                                color: (lecTapped == 0)
                                    ? Colors.black
                                    : Colors.grey[400],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Divider(
                                color: (lecTapped == 0)
                                    ? Colors.black
                                    : Colors.transparent,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            lecTapped = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'More',
                              style: AppTheme.subHeading.copyWith(
                                color: (lecTapped != 0)
                                    ? Colors.black
                                    : Colors.grey[400],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Divider(
                                color: (lecTapped != 0)
                                    ? Colors.black
                                    : Colors.transparent,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                (lecTapped == 0)
                    ? lectureBody()
                    : Container(
                        child: Center(
                          child: Text(
                            widget.courses.contant,
                            style: AppTheme.subHeading,
                          ),
                        ),
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

  Column lectureBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Section 2 -Introduction',
            style: AppTheme.subHeading.copyWith(
              color: Colors.grey[400],
            ),
          ),
        ),
        lectureDetaile(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Section 2 -SetUp',
            style: AppTheme.subHeading.copyWith(
              color: Colors.grey[400],
            ),
          ),
        ),
        lectureDetaile(),
      ],
    );
  }

  ListView lectureDetaile() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  '${index + 1}',
                  style: AppTheme.heading.copyWith(
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: customColor,
                          ),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Welcom to 2 course',
                          style: AppTheme.heading,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Video -10.22 mins-Resources (1)',
                      style: AppTheme.subHeading.copyWith(
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: customColorDivider,
              thickness: 2,
            ),
          ],
        );
      },
    );
  }

  courseDetail() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'solving problem with your son',
                  style: AppTheme.heading,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.starHalfAlt,
                      color: Colors.yellow[900],
                    ),
                    SizedBox(width: 5),
                    Text(
                      '(${widget.courses.rating}K)',
                      style: AppTheme.heading,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.courses.newPrice + '\$',
            style: AppTheme.heading,
          ),
        ],
      ),
    );
  }
}
