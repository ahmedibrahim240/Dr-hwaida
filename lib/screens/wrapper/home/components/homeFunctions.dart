import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/models/events.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';
import 'package:DrHwaida/screens/Evaents/eventsPageView.dart';
import 'package:DrHwaida/screens/Evaents/eventspage.dart';
import 'package:DrHwaida/screens/consultantPageView/consultantPageView.dart';
import 'package:DrHwaida/screens/courses/chosesColurses.dart';
import 'package:DrHwaida/screens/courses/coursesDetails.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Container eventSlider({BuildContext context, List<CustomEvent> evetList}) {
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
          items: evetList
              .map(
                (items) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => EventsPageView(
                          events: items,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 300,
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  image: DecorationImage(
                                    image: AssetImage(items.imageUl),
                                    //  NetworkImage(
                                    //   items,
                                    // ),
                                    fit: BoxFit.cover,
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
///////////////////////////////////////////////////////////////////////////////////////

Container rowofHmeTaps(BuildContext context) {
  return Container(
    height: 130,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        homeTabs(
          title: 'Consultants',
          iconImage: 'lib/images/consulantent.png',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Consultant(),
              ),
            );
          },
        ),
        homeTabs(
          title: 'Courses',
          iconImage: 'lib/images/courses.png',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChosesCourses(),
              ),
            );
          },
        ),
        homeTabs(
          title: 'Events',
          iconImage: 'lib/images/eventicons.png',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => EventsPage(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////

Container homeTabs({String title, String iconImage, Function onTap}) {
  return Container(
    width: 120,
    child: InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(iconImage),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: AppTheme.heading.copyWith(
                  color: customColor,
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

consulHomeCard({
  String imageUrl,
  String oldPrie,
  String newPrie,
  String consulName,
  double rate,
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
                      backgroundImage: AssetImage(imageUrl),
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
                              Text(
                                oldPrie + '\$',
                                style: AppTheme.subHeading.copyWith(
                                  color: customColorDivider,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                newPrie + '\$',
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
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

sctionTitle({String title, Function onTap}) {
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
            'View All',
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
Container consulHomeList(String imageUrl, String oldPrie, String newPrie,
    String consulName, double rate) {
  return Container(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: (context, index) {
        return consulHomeCard(
          imageUrl: imageUrl,
          oldPrie: oldPrie,
          newPrie: newPrie,
          consulName: consulName,
          rate: rate,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ConsultantPageView(
                  consultName: consulName,
                  imagUrl: imageUrl,
                  rating: rate.toString(),
                  location: 'elmansora',
                  oldPrice: oldPrie,
                  newPrice: newPrie,
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

///////////////////////////////////////////////////////////////
Container homecoursesList(context) {
  return Container(
    height: 250,
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
