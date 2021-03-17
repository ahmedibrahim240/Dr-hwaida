import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/consultant.dart';
import 'package:DrHwaida/models/consultantApi.dart';

import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';
import 'package:DrHwaida/screens/Evaents/eventspage.dart';
import 'package:DrHwaida/screens/consultantPageView/consultantPageView.dart';

import 'package:DrHwaida/screens/courses/coursesDetails.dart';
import 'package:DrHwaida/screens/courses/coursesPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

FutureBuilder<List<Consultant>> getConsultant() {
  return FutureBuilder(
    future: ConsultantApi.fetchAllConsultant(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return (snapshot.data == null)
            ? Container()
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, index) {
                  print(snapshot.data[index].badges);
                  return consulHomeCard(
                    imageUrl: snapshot.data[index].image,
                    oldPrie: snapshot.data[index].coust,
                    newPrie: snapshot.data[index].total_coust,
                    consulName: snapshot.data[index].name,
                    discount: snapshot.data[index].discount,
                    rate: double.parse(
                      snapshot.data[index].rate,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ConsultantPageView(
                            consultant: snapshot.data[index],
                            consulId: snapshot.data[index].id,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}

///////////////////////////////////////////////////////////////////////////////////////

Container rowofHmeTaps(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    height: 130,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: homeTabs(
            title: getTranslated(context, "consultants"),
            iconImage: 'lib/images/consulantent.png',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ConsultantPage(),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: homeTabs(
            title: getTranslated(context, "Courses"),
            iconImage: 'lib/images/courses.png',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CoursesPage(title: 'All Courses'),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: homeTabs(
            title: getTranslated(context, "Events"),
            iconImage: 'lib/images/eventicons.png',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => EventsPage(),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

Container homeTabs({String title, String iconImage, Function onTap}) {
  return Container(
    width: 120,
    height: 100,
    // padding: EdgeInsets.symmetric(horizontal: 5),
    child: InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(iconImage),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: AppTheme.subHeading,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

consulHomeCard({
  String imageUrl,
  String oldPrie,
  double newPrie,
  String consulName,
  double rate,
  String discount,
  Function onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 200,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 65,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppTheme.containerBackground,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (discount != '0')
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          oldPrie,
                                          style: AppTheme.subHeading.copyWith(
                                            color: customColorDivider,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.poundSign,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                      ],
                                    )
                                  : Container(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    newPrie.toString(),
                                    style: AppTheme.heading.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.poundSign,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                child: Column(
                  children: [
                    Text(
                      consulName,
                      style: AppTheme.subHeading.copyWith(
                        color: customColor,
                      ),
                    ),
                    RatingStar(
                      isReadOnly: true,
                      rating: rate,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

sctionTitle({String title, Function onTap, BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.heading.copyWith(
            color: customColor,
            fontSize: 16,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            getTranslated(context, "more"),
            style: AppTheme.subHeading,
          ),
        ),
      ],
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

paner(BuildContext context) {
  return Card(
    elevation: 4,
    child: Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/event.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

///////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
Container homecoursesList(context) {
  return Container(
    height: 300,
    child: ListView.builder(
      itemCount: listCourses.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return homeCoursesCard(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CoursesDetails(
                  courses: listCourses[index],
                ),
              ),
            );
          },
          courses: listCourses[index],
          context: context,
        );
      },
    ),
  );
}

////////////////////////////////////////////////////////////////
homeCoursesCard({BuildContext context, Function onTap, Courses courses}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 240,
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(courses.courseImageUrl),
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
                              width: 200,
                              child: Text(
                                courses.contant.substring(0, 100),
                                style: AppTheme.subHeading.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              courses.title,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingStar(
                          rating: courses.rating,
                          isReadOnly: true,
                        ),
                        Row(
                          children: [
                            Text(
                              courses.oldPrice + '\$',
                              style: AppTheme.heading.copyWith(
                                color: Colors.grey[500],
                                fontSize: 8,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              courses.newPrice + '\$',
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
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
