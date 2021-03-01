import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/screens/Consultant/consultant.dart';
import 'package:DrHwaida/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../../sharedPreferences.dart';

class ConsultantFillter extends StatefulWidget {
  static int filtterTapped;
  @override
  _ConsultantFillterState createState() => _ConsultantFillterState();
}

class _ConsultantFillterState extends State<ConsultantFillter> {
  List<String> fillterList = [
    'Closest',
    'Recent',
    'HD Certified',
    'Rate',
  ];
  List<String> fillterApi = [
    'location',
    'recent',
    'certificated',
    'rate',
  ];
  gitFillterIndex() async {
    ConsultantFillter.filtterTapped =
        await MySharedPreferences.getFiltterIndex();
    ConsultantPage.fillter = await MySharedPreferences.getFiltterType();
  }

  @override
  void initState() {
    gitFillterIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.rotate(
              angle: 180 * 3.14 / 365,
              child: SvgPicture.asset(
                "assets/icons/filter.svg",
                color: customColor,
                height: 25,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        ListView.builder(
          itemCount: fillterList.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    print(index);
                    if (index == 0) {
                      if (User.userlat == null && User.userlong == null) {
                        showmyDialog(context: context);
                        setState(() {
                          MySharedPreferences.saveFilltterIndex(index);
                          ConsultantFillter.filtterTapped = index;
                        });
                      } else {
                        setState(() {
                          ConsultantFillter.filtterTapped = index;
                          ConsultantPage.fillter = fillterApi[index];
                          MySharedPreferences.saveFilltterIndex(index);
                          MySharedPreferences.saveFilltterType(
                              fillterApi[index]);
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => ConsultantPage(),
                          ),
                          ModalRoute.withName('/'),
                        );
                      }
                    } else {
                      setState(() {
                        ConsultantFillter.filtterTapped = index;
                        ConsultantPage.fillter = fillterApi[index];
                        MySharedPreferences.saveFilltterIndex(index);
                        MySharedPreferences.saveFilltterType(fillterApi[index]);
                      });
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => ConsultantPage(),
                        ),
                        ModalRoute.withName('/'),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fillterList[index],
                        style: AppTheme.heading.copyWith(
                          color: (ConsultantFillter.filtterTapped == index)
                              ? Colors.black
                              : Colors.grey[500],
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (ConsultantFillter.filtterTapped == index)
                              ? customColor
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.check,
                            color: (ConsultantFillter.filtterTapped == index)
                                ? Colors.white
                                : Colors.transparent,
                            size: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: customColorDivider,
                  thickness: 2,
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomButtonWithchild(
            color: customColor,
            onPress: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => ConsultantPage()),
                ModalRoute.withName('/'),
              );
            },
            child: Center(
              child: Text(
                'Search',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> showmyDialog({BuildContext context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'You should allow to get your location before complete your search,',
                  style: AppTheme.heading.copyWith(
                    color: customColor,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              color: customColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Text(
                'Allow',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                try {
                  final geoposition = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  setState(() {
                    User.userlat = '${geoposition.latitude}';
                    User.userlong = '${geoposition.longitude}';
                    MySharedPreferences.saveUserlong(
                        '${geoposition.longitude}');
                    MySharedPreferences.saveUserlat('${geoposition.latitude}');
                  });
                } catch (e) {
                  print('geoposition Erorr:' + e.toString());
                }
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => SplashScreen()),
                );
              },
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: AppTheme.heading.copyWith(
                  color: customColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
