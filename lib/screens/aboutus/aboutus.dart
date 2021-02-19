import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';

import '../CustomBottomNavigationBar.dart';

class AboutUS extends StatefulWidget {
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  String contant =
      'SimpleText is the native text editor for the SimpleText is the native text editor for the SimpleText is the native text editor for the SimpleText is the native text editor for the SimpleText is the native text editor for the SimpleText is the native text editor for the';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'About Us'),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'lib/images/aboutus.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    contant +
                        contant +
                        contant +
                        contant +
                        contant +
                        contant +
                        contant +
                        contant +
                        contant,
                    style: AppTheme.subHeading.copyWith(
                      height: 1.5,
                      letterSpacing: .07,
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
}
