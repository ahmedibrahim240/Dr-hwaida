import 'dart:async';
import 'dart:io';
import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/services/network_sensitive.dart';
import 'package:flutter/material.dart';
import '../sharedPreferences.dart';
import 'onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  static final route = '/splashScreen';

  static bool slider = true;
  static void isSlider() {
    slider = !slider;
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getDateOfUser() async {
    User.userLogIn = await MySharedPreferences.getUserSingIn();
    User.userToken = await MySharedPreferences.getUserUserToken();
    if (User.appLang == null) {
      print(Platform.localeName);
      setState(() {
        MySharedPreferences.saveAppLang(Platform.localeName);
        MySharedPreferences.saveApiLang(apiLang());
      });
    } else {
      MySharedPreferences.saveApiLang(apiLang());
    }
    User.apiLang = await MySharedPreferences.getApiLang();
    MySharedPreferences.saveApiLang(apiLang());
    print('Api:' + User.apiLang);
    print('Applanshard:${User.appLang}');
  }

  @override
  void initState() {
    getDateOfUser();

    super.initState();

    Timer(
      Duration(seconds: 10),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => OnBoard(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: customColor,
      ),
      body: NetworkSensitive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/logo.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
