import 'package:DrHwaida/comingSoon.dart';
import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/visaCard.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:DrHwaida/screens/sucessfullyBooked/sucessfullyBooked.dart';
import 'package:DrHwaida/screens/wrapper/home/home.dart';
import 'package:DrHwaida/services/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';

class CheckOut extends StatefulWidget {
  final String totalPrice;
  final int consultantid;
  final int avilableId;
  final String avilableDate;
  final int productId;

  const CheckOut({
    Key key,
    @required this.totalPrice,
    @required this.consultantid,
    @required this.avilableId,
    @required this.productId,
    @required this.avilableDate,
  }) : super(key: key);
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DbHehper helper;
  String _totalPrice;
  bool loading = false;
  @override
  void initState() {
    helper = DbHehper();
    _totalPrice = widget.totalPrice;
    super.initState();
  }

  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ComingSoon(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.moneyCheckAlt,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                getTranslated(context, "addCard"),
                style: AppTheme.subHeading.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          getTranslated(context, "payment"),
          style: AppTheme.heading.copyWith(color: Colors.white),
        ),
      ),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 160,
                  child: ListView(
                    shrinkWrap: true,
                    primary: true,
                    children: [
                      SizedBox(height: 20),
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
                                Text(getTranslated(context, "Cash")),
                              ],
                            ),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      getTranslated(context, "Total_Price") +
                                          ' : ',
                                      style: AppTheme.heading.copyWith(
                                        color: customColor,
                                      ),
                                    ),
                                    Text(
                                      _totalPrice,
                                      style: AppTheme.heading,
                                    ),
                                  ],
                                ),
                                //
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomButtonWithchild(
                        color: customColor,
                        onPress: () {
                          setState(() {
                            loading = !loading;
                          });
                          checkOut(
                            consultId: widget.consultantid,
                            availableId: widget.avilableId,
                            availabeDate: widget.avilableDate,
                          );
                        },
                        child: Text(
                          getTranslated(context, "confirm"),
                          style: AppTheme.heading.copyWith(
                            fontSize: 16,
                            color: Colors.white,
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

  checkOut({int consultId, int availableId, String availabeDate}) async {
    try {
      var response = await http.post(
        Utils.CHECKOUT_URL,
        body: {
          'consultant_id': consultId.toString(),
          'available_id': availableId.toString(),
          'visit_date': availabeDate,
        },
        headers: {
          'x-api-key': User.userToken,
        },
      );

      Map<String, dynamic> map = json.decode(response.body);

      if (map['success'] == true) {
        setState(() {
          loading = !loading;
          _totalPrice = '';
        });
        await helper.deleteProduct(widget.productId);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => SucessfullyBooked(),
          ),
        );
      } else {
        setState(() {
          loading = !loading;
        });

        _scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: new Text(
                'Your reservation failed,please try again${map['message']}'),
          ),
        );
      }

      // Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
}
