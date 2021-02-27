import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/gitAllvisits.dart';

class VisitsHistory extends StatefulWidget {
  @override
  _VisitsHistoryState createState() => _VisitsHistoryState();
}

class _VisitsHistoryState extends State<VisitsHistory> {
  String visaName = 'Visa';
  String visaNumber = '25555555555555555555555555';
  String date = '2May202';
  String price = '555';
  String userName = 'Ahmed Ibrahim';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Payment History'),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          Text(
            'Consultant',
            style: AppTheme.heading.copyWith(
              color: customColor,
              fontSize: 20,
            ),
          ),
          Divider(
            color: customColorDivider,
            thickness: 2,
          ),
          SizedBox(height: 20),
          gitAllVisist(),
          // ListView.builder(
          //   shrinkWrap: true,
          //   primary: false,
          //   itemCount: 10,
          //   itemBuilder: (context, index) {
          //     return VisaCard(
          //       visaName: visaName,
          //       visaNumber: visaNumber,
          //       date: date,
          //       price: price,
          //       userName: userName,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
