import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/visaCard.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/checkOut/components/functions.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 20,
            ),
            child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
              label: Text(
                'Add New Card',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                ),
              ),
              onPressed: () {
                setState(() {
                  Helper.chossenDate = '';
                });

                createVisaCard(context);
              },
            ),
          ),
        ],
        title: Text(
          'Payment',
          style: AppTheme.heading.copyWith(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                RadioListTile(
                  groupValue: id,
                  value: 0,
                  title: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.dollarSign,
                            color: customColor,
                          ),
                          SizedBox(width: 10),
                          Text('Cash'),
                        ],
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      print('Val:: $val');

                      id = val;
                    });
                  },
                ),
                Column(
                  children: Helper.visaCardList.map((data) {
                    return RadioListTile(
                      groupValue: id,
                      value: data.index,
                      title: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.ccVisa,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        "Card Number",
                                        style: AppTheme.subHeading,
                                      ),
                                      SizedBox(height: 10),
                                      Text("Expriy Date"),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${data.cardNumber.substring(0, 3)}*********",
                                    style: AppTheme.subHeading,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${data.exDate}",
                                    style: AppTheme.subHeading,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          id = data.index;
                          print('index ::::${data.index}');
                        });
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: CustomButtonWithchild(
                    color: customColor,
                    onPress: () {},
                    child: Text(
                      'Confirm',
                      style: AppTheme.heading.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
