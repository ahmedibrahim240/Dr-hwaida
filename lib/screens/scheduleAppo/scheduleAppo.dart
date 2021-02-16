import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/cart/card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScheduleAppo extends StatefulWidget {
  @override
  _ScheduleAppoState createState() => _ScheduleAppoState();
}

class _ScheduleAppoState extends State<ScheduleAppo> {
  bool showDate = false;
  bool showTime = false;
  bool showEvenig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Schedule Appointment'),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          rowTitle(
            title: 'date',
            onPrssed: () {
              setState(() {
                showDate = !showDate;
              });
            },
          ),
          SizedBox(height: 20),
          (showDate) ? dateListView() : Container(),
          SizedBox(height: 10),
          rowTitle(
            title: 'Time',
            onPrssed: () {
              setState(() {
                showTime = !showTime;
              });
            },
          ),
          SizedBox(height: 20),
          (showTime) ? Container() : timeListView(),
          SizedBox(height: 10),
          rowTitle(
            title: 'Evening',
            onPrssed: () {
              setState(() {
                showEvenig = !showEvenig;
              });
            },
          ),
          (showEvenig) ? Container() : timeListView(),
          SizedBox(height: 10),
          CustomButtonWithchild(
            color: customColor,
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Cart(),
                ),
              );
            },
            child: Text(
              'Confirm Appoinent',
              style: AppTheme.heading.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container timeListView() {
    return Container(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              timeCard(index + 1),
              timeCard(index + 2),
            ],
          );
        },
      ),
    );
  }

  Container dateListView() {
    return Container(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            semanticContainer: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Day',
                    style: AppTheme.heading,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$index',
                    style: AppTheme.subHeading,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Card timeCard(int index) {
    return Card(
      elevation: 4,
      semanticContainer: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 110,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.clock,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                '0$index:00 Am',
                style: AppTheme.subHeading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  rowTitle({String title, Function onPrssed}) {
    return GestureDetector(
      onTap: onPrssed,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTheme.heading,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_drop_down,
                  color: customColor,
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: customColorDivider,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
