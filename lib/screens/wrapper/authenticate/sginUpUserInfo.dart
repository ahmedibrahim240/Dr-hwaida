import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';
  String name = '';
  String error = '';
  String email = '';
  bool obscurePassword = true;
  bool obscureconPassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: AppTheme.containerBackground,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Join us",
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
                            style: TextStyle(color: Colors.white),
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
                        // Card(
                        //   elevation: 2.0,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20.0),
                        //   ),
                        //   child: TextFormField(
                        //     keyboardType: TextInputType.number,
                        //     style: TextStyle(color: Colors.white),
                        //     validator: (val) => val.isEmpty
                        //         ? 'please enter your phone number'
                        //         : null,
                        //     onChanged: (val) {},
                        //     decoration: textFormInputDecoration(
                        //       Icons.person,
                        //       "Age",
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () => showSettingsPanel(
                            context: context,
                            child: Center(
                              child: Text(
                                'Age',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
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
                                  Text(
                                    'Age',
                                    style: AppTheme.heading.copyWith(
                                      color: customColor,
                                    ),
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
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () => showSettingsPanel(
                            context: context,
                            child: Center(
                              child: Text(
                                'Gender',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
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
                                  Text(
                                    'Gender',
                                    style: AppTheme.heading.copyWith(
                                      color: customColor,
                                    ),
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
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () => showSettingsPanel(
                            context: context,
                            child: Center(
                              child: Text(
                                'Status',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
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
                                  Text(
                                    'Status',
                                    style: AppTheme.heading.copyWith(
                                      color: customColor,
                                    ),
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
                              "I dont have an account!",
                              style: AppTheme.heading.copyWith(),
                            ),
                            InkWell(
                              onTap: () => widget.toggleView(),
                              child: Text(
                                'Login?',
                                style: AppTheme.heading.copyWith(
                                  decoration: TextDecoration.underline,
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
