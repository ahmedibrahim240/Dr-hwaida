import 'package:flutter/material.dart';
import '../CustomBottomNavigationBar.dart';
import 'components/videoscreens.dart';

class MyCoursesDetails extends StatefulWidget {
  @override
  _MyCoursesDetailsState createState() => _MyCoursesDetailsState();
}

class _MyCoursesDetailsState extends State<MyCoursesDetails> {
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
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ChewieVideo(),
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
