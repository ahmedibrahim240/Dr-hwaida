import 'package:DrHwaida/constants/constans.dart';

import 'package:flutter/material.dart';
import '../CustomBottomNavigationBar.dart';
import 'conponents/cinsltantAppBar.dart';

import 'conponents/getConsultant.dart';

class ConsultantPage extends StatefulWidget {
  @override
  _ConsultantPageState createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 50,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                consultantAppBer(context),
                getAllConsultant(),
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
