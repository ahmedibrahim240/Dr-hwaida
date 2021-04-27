import 'dart:async';
import 'dart:io';
import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:connectivity/connectivity.dart';
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

  bool _connectionStatus = false;
  Connectivity connectivity;
  // ignore: cancel_subscriptions
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    getDateOfUser();

    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      print("result______________________________________");
      print(result);
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          _connectionStatus = !_connectionStatus;
        });
      } else {
        _connectionStatus = !_connectionStatus;
      }
    });
    print("_connectionStatus:$_connectionStatus");

    Timer(
      Duration(seconds: 5),
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: customColor,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: AppTheme.containerBackground,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80),
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
        ],
      ),
    );
  }
}
