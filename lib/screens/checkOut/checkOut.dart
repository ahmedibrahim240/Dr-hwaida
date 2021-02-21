import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/visaCard.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckOut extends StatefulWidget {
  final String totalPrice;

  const CheckOut({Key key, @required this.totalPrice}) : super(key: key);
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
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: customColor),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Price: ',
                                style: AppTheme.subHeading.copyWith(),
                              ),
                              Text(
                                widget.totalPrice,
                                style: AppTheme.subHeading.copyWith(
                                  color: customColor,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: FlatButton.icon(
                              color: customColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (_) => CheckOut(),
                                //   ),
                                // );
                              },
                              icon: Icon(
                                FontAwesomeIcons.moneyCheckAlt,
                                color: Colors.white,
                                size: 20,
                              ),
                              label: Text(
                                'Check Out',
                                style: AppTheme.subHeading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
