import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/categories.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:DrHwaida/models/coursesApi.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/courses/categoriesCourse.dart';
import 'package:DrHwaida/screens/courses/coursesDetails.dart';
import 'package:DrHwaida/screens/courses/coursesPage.dart';
import 'package:DrHwaida/screens/wrapper/home/components/homeFunctions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
                sctionTitle(
                    title: getTranslated(context, 'Courses'),
                    context: context,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CoursesPage(title: 'All Courses'),
                        ),
                      );
                    }),
                FutureBuilder(
                  future: CoursesApi.fetchAllCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return (snapshot.data == null)
                          ? Container()
                          : coursesSilder(
                              context: context, coursesList: snapshot.data);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Divider(
                    color: customColorDivider,
                    thickness: 2,
                  ),
                ),
                Text(
                  getTranslated(context, 'sections'),
                  style: AppTheme.heading.copyWith(
                    color: customColor,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: CategoriesApi.fetchAllCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return (snapshot.data == null)
                          ? Container()
                          : Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                primary: false,
                                shrinkWrap: true,
                                children: List.generate(
                                  snapshot.data.length,
                                  (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => CategoriesCourse(
                                                cateId: snapshot.data[index].id,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data[index].image_path),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  snapshot.data[index].name,
                                                  style:
                                                      AppTheme.heading.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
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
                          builder: (_) => CoursesDetails(
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
                                      image: NetworkImage(items.courseImageUrl),
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
                                          parseHtmlString(items.contant),
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
