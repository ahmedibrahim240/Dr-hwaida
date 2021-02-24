import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/menu/menu.dart';
import 'package:DrHwaida/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/homeAppBer.dart';
import 'components/homeFunctions.dart';

class Home extends StatefulWidget {
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
  }

  @override
  void initState() {
    getDateOfUser();
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
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                CustomHomeAppBer(scaffoldKey: scaffoldKey),
                rowofHmeTaps(context),
                paner(context),
                sctionTitle(
                    title: 'Consultants',
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
                // sctionTitle(
                //     title: 'Consultants',
                //     onTap: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (_) => ConsultantPage(),
                //         ),
                //       );
                //     }),

                // ListView.builder(
                //     // scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     primary: false,
                //     itemCount: consultantList.length,
                //     padding: EdgeInsets.symmetric(horizontal: 5),
                //     itemBuilder: (context, index) {
                //       return consulHomeCard(
                //         imageUrl: consultantList[index].image,
                //         oldPrie: consultantList[index].coust,
                //         newPrie: consultantList[index].coust,
                //         consulName: consultantList[index].name,
                //         rate: double.parse(consultantList[index].rate),
                //         onTap: () {
                //           Navigator.of(context).push(
                //             MaterialPageRoute(
                //               builder: (_) => ConsultantPageView(
                //                 consultant: consultantList[index],
                //               ),
                //             ),
                //           );
                //         },
                //       );
                //     }),

                // sctionTitle(
                //     title: 'Courses',
                //     onTap: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (_) => CoursesPage(title: 'All Courses'),
                //         ),
                //       );
                //     }),
                // homecoursesList(context),
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
