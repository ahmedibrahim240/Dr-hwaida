import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SginUpUserInfo extends StatefulWidget {
  final Function toggleViewSignUp;
  final Function toggleView;

  SginUpUserInfo({this.toggleViewSignUp, this.toggleView});
  @override
  _SginUpUserInfoState createState() => _SginUpUserInfoState();
}

class _SginUpUserInfoState extends State<SginUpUserInfo> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String sigle;
  String married;
  String engaged;
  String male;
  String female;
  String name = '';
  String error = '';
  bool obscurePassword = true;
  bool obscureconPassword = true;
  String chossenDate;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
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
            child: ClipPath(
              clipper: MyCliper(),
              child: Container(
                height: 220,
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: AppTheme.containerBackground,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/images/logo.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Join Us',
                        style: AppTheme.heading.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            validator: (val) =>
                                val.isEmpty ? 'please enter your name' : null,
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                            decoration: textFormInputDecoration(
                              Icons.person,
                              'name',
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        //START:: DATE

                        InkWell(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              onChanged: (date) {
                                print('change $date in time zone ' +
                                    date.timeZoneOffset.inHours.toString());
                              },
                              onConfirm: (date) {
                                setState(() {
                                  chossenDate = '$date';
                                });
                                print('confirm $date');
                              },
                              currentTime: DateTime.now(),
                            );
                          },
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: customColor),
                            ),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.grey[500],
                                        size: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        (chossenDate) ?? 'Age',
                                        style: AppTheme.heading.copyWith(
                                          color: customColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: customColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //END:: DATA

                        SizedBox(height: 10),
                        //START:: GENDER

                        InkWell(
                          onTap: () => showSettingsPanel(
                            context: context,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: ClipPath(
                                    clipper: MyCliper(),
                                    child: Container(
                                      height: 210,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        gradient: AppTheme.containerBackground,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Gender",
                                          style: AppTheme.heading.copyWith(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      'lib/images/man.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Male',
                                              style:
                                                  AppTheme.heading.copyWith(),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'lib/images/female.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'female',
                                              style:
                                                  AppTheme.heading.copyWith(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: customColor),
                            ),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.venusMars,
                                        color: Colors.grey[500],
                                        size: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Gender',
                                        style: AppTheme.heading.copyWith(
                                          color: customColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: customColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //END:: GENDER

                        SizedBox(height: 10),
                        //START:: STAUTS
                        InkWell(
                          onTap: () => showSettingsPanel(
                            context: context,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: ClipPath(
                                    clipper: MyCliper(),
                                    child: Container(
                                      height: 210,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        gradient: AppTheme.containerBackground,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Status",
                                          style: AppTheme.heading.copyWith(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 120),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'lib/images/single.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Single',
                                                style:
                                                    AppTheme.heading.copyWith(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 50),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'lib/images/engaged.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Engaged',
                                              style:
                                                  AppTheme.heading.copyWith(),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(width: 10),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/images/married.png'),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(height: 5),
                                        Text(
                                          'Married',
                                          style: AppTheme.heading.copyWith(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: customColor),
                            ),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'lib/images/status.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Status',
                                        style: AppTheme.heading.copyWith(
                                          color: customColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: customColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //END:: STAUTS

                        SizedBox(height: 10),
                        CustomButton(
                          onPress: () => widget.toggleViewSignUp(),
                          text: 'Next',
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "have an account!",
                              style: AppTheme.heading.copyWith(),
                            ),
                            InkWell(
                              onTap: () => widget.toggleView(),
                              child: Text(
                                'Login?',
                                style: AppTheme.heading.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: customColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
