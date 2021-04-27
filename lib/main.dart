import 'dart:async';
import 'dart:io';

import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/interNetCon.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/routes.dart';
import 'package:DrHwaida/screens/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localization.dart';
import 'localization/localization_constants.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _connectionStatus = false;
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  Locale _locale;
  setLocale(Locale locale) async {
    setState(() {
      _locale = locale;
      // DBHelper.saveAppLang(locale.toString());
    });
    print('Applan:' + locale.toString());
    print('Applanshard:' + User.appLang);
  }

  @override
  void initState() {
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      print(result);
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          _connectionStatus = false;
        });
      } else {
        setState(() {
          _connectionStatus = true;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      // if (User.appLang == null) {
      //   setState(() {
      //     // ignore: unnecessary_statements
      //     this._locale == null;
      //   });
      // } else {
      setState(() {
        this._locale = locale;
      });
      // }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("_connectionStatus:$_connectionStatus");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryColor: customColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      initialRoute:
          (_connectionStatus) ? EnterNitCON.route : SplashScreen.route,
      routes: routes,
      locale: _locale,
      supportedLocales: [
        const Locale('ar', 'EG'),
        const Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (User.appLang == null) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == Platform.localeName.split('_')[0] &&
                locale.countryCode == Platform.localeName.split('_')[1]) {
              return locale;
            }
          }

          return supportedLocales.first;
        } else {
          for (var locale in supportedLocales) {
            if (locale.languageCode == User.appLang.split('_')[0] &&
                locale.countryCode == User.appLang.split('_')[1]) {
              return locale;
            }
          }

          return supportedLocales.first;
        }
      },
    );
  }
}
