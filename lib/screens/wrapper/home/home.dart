import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';

import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';

import 'package:DrHwaida/screens/menu/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/homeAppBer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0,
      ),
      key: scaffoldKey,
      // backgroundColor: customColorDivider,
      drawer: Drawer(
        child: Menu(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          CustomHomeAppBer(scaffoldKey: scaffoldKey),
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  child: Card(
                    elevation: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.bookOpen,
                            color: Colors.black,
                          ),
                          SizedBox(height: 20),
                          Text('Courses'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          eventView(context),
          sctionTitle(
              title: 'Consultants',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Consultant(),
                  ),
                );
              }),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 5),
              itemBuilder: (context, index) {
                return Container(
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
                                  backgroundImage:
                                      AssetImage('lib/images/person.jpg'),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '555',
                                            style: AppTheme.subHeading.copyWith(
                                              color: customColorDivider,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '450',
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
                                  'Dr.Assma alaa',
                                  style: AppTheme.subHeading.copyWith(
                                    color: customColor,
                                  ),
                                ),
                                RatingStar(
                                  isReadOnly: true,
                                  rating: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

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

  eventView(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 200,
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
}
