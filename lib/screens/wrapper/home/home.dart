import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/screens/Consultant/conponents/consultantfillter.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/courses/components/coursesfillter.dart';
import 'package:DrHwaida/screens/courses/coursesPage.dart';
import 'package:DrHwaida/screens/menu/menu.dart';
import 'package:DrHwaida/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/homeAppBer.dart';
import 'components/homeFunctions.dart';

class Home extends StatefulWidget {
  static final route = '/';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  getDateOfUser() async {
    User.userAge = await MySharedPreferences.getUserUserAge();
    User.userGender = await MySharedPreferences.getUserUserGender();
    User.userStutes = await MySharedPreferences.getUserUserStutes();
    User.userName = await MySharedPreferences.getUserUserName();
    User.userPhoneNum = await MySharedPreferences.getUserUserPhoneNumber();
    User.userSkipLogIn = await MySharedPreferences.getUserSkipLogIn();
    User.userPassword = await MySharedPreferences.getUserUserPassword();
    User.userlat = await MySharedPreferences.getUserLat();
    User.userlong = await MySharedPreferences.getUserlong();
    User.appLang = await MySharedPreferences.getAppLang();
  }

  gitFillterType() {
    if (User.userlat != null && User.userlong != null) {
      setState(() {
        ConsultantPage.fillter = 'location';
        MySharedPreferences.saveFilltterType('location');

        MySharedPreferences.saveFilltterIndex(0);
      });
    } else {
      setState(() {
        ConsultantPage.fillter = 'recent';
        MySharedPreferences.saveFilltterType('location');

        MySharedPreferences.saveFilltterIndex(1);
      });
    }
    setState(() {
      CoursesPage.fillter = 'latest';
      MySharedPreferences.saveCoursesFilltterType('latest');

      MySharedPreferences.saveCoursesFilltterIndex(0);
    });
  }

  gitFillterIndex() async {
    ConsultantFillter.filtterTapped =
        await MySharedPreferences.getFiltterIndex();
    ConsultantPage.fillter = await MySharedPreferences.getFiltterType();
    CoursesFillter.filtterTapped =
        await MySharedPreferences.getCoursesFiltterIndex();
    CoursesPage.fillter = await MySharedPreferences.getCoursesFiltterType();
  }

  @override
  void initState() {
    getDateOfUser();
    gitFillterType();
    gitFillterIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0,
      ),
      key: scaffoldKey,
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 130,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                CustomHomeAppBer(scaffoldKey: scaffoldKey),
                rowofHmeTaps(context),
                paner(context),
                sctionTitle(
                    title: getTranslated(context, "consultants"),
                    context: context,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ConsultantPage(),
                        ),
                      );
                    }),
                Container(
                  height: 200,
                  child: getConsultant(),
                ),
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
                Container(
                  height: 200,
                  child: getCourses(),
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
}
