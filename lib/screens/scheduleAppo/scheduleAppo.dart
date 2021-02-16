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
  int tappedDate;
  int tappedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Schedule Appointment'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  rowTitle(
                    title: 'date',
                  ),
                  dateListView(),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rowTitle(
                    title: 'Time',
                  ),
                  timeListView(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButtonWithchild(
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
            ),
          ],
        ),
      ),
    );
  }

  Container timeListView() {
    return Container(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return timeCard(index + 1);
        },
      ),
    );
  }

  Container dateListView() {
    return Container(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                tappedDate = index;
              });
            },
            child: Card(
              elevation: 4,
              semanticContainer: false,
              color: tappedDate == index ? customColor : Colors.white,
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
                      style: AppTheme.heading.copyWith(
                        color:
                            tappedDate == index ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '$index',
                      style: AppTheme.subHeading.copyWith(
                        color:
                            tappedDate == index ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  timeCard(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          tappedTime = index;
        });
      },
      child: Card(
        elevation: 4,
        color: tappedTime == index ? customColor : Colors.white,
        semanticContainer: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 80,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: tappedTime == index ? Colors.white : Colors.black,
                  size: 35,
                ),
                SizedBox(height: 5),
                Text(
                  '0$index:00 Am',
                  style: AppTheme.subHeading.copyWith(
                    color: tappedTime == index ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  rowTitle({String title}) {
    return Container(
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
    );
  }
}
