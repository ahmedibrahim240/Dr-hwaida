import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/routes.dart';
import 'package:DrHwaida/screens/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/app_localization.dart';
import 'localization/localization_constants.dart';

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
  Locale _locale;
  setLocale(Locale locale) async {
    setState(() {
      _locale = locale;
      // DBHelper.saveAppLang(locale.toString());
    });
    print('Applan:' + locale.toString());
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryColor: customColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      initialRoute: SplashScreen.route,
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
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }

        return supportedLocales.first;
      },
    );
  }
}
