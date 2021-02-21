import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/signUp/singUpUserInfo/components/gender.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/signUp/singUpUserInfo/components/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/age.dart';

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
          CustomAppBar(
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
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 30, right: 30),
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
                        Age(),
                        SizedBox(height: 10),
                        Gender(),
                        SizedBox(height: 10),
                        Status(),
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
