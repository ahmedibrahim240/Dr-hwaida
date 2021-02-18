import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/models/events.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/Evaents/eventspage.dart';
import 'package:DrHwaida/screens/menu/menu.dart';
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

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'lib/images/person.jpg';
    String oldPrie = '550';
    String newPrie = '450';
    String consulName = 'DR.Assma Alla';
    double rate = 4;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0,
      ),
      key: scaffoldKey,
      drawer: Drawer(
        child: Menu(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          CustomHomeAppBer(scaffoldKey: scaffoldKey),
          rowofHmeTaps(context),
          paner(context),
          sctionTitle(
              title: 'ُEvents',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EventsPage(),
                  ),
                );
              }),
          eventSlider(context: context, evetList: listEvent),
          sctionTitle(
              title: 'Consultants',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Consultant(),
                  ),
                );
              }),
          consulHomeList(imageUrl, oldPrie, newPrie, consulName, rate),
        ],
      ),
    );
  }
}
