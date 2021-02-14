import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Payment History'),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.grey,
                    Colors.grey[500],
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add New Card',
                    style: AppTheme.heading.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey[300],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              FontAwesomeIcons.ccVisa,
                              color: customColor,
                              size: 40,
                            ),
                            Text(
                              'Visa',
                              style: AppTheme.heading,
                            ),
                            Text(
                              '2225*************',
                              style: AppTheme.heading,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2May202',
                              style: AppTheme.heading,
                            ),
                            Text(
                              '\$555',
                              style: AppTheme.heading,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Consultant Title',
                          style: AppTheme.heading.copyWith(
                            color: customColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
