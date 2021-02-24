import 'package:DrHwaida/comingSoon.dart';
import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/screens/aboutus/aboutus.dart';
import 'package:DrHwaida/screens/contactus/contactus.dart';
import 'package:DrHwaida/screens/notifications/notifications.dart';
import 'package:DrHwaida/screens/settings/settings.dart';
import 'package:DrHwaida/screens/splashscreen.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/registerAsConsultant/registerAsConsultant.dart';
import 'package:DrHwaida/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menucontant.dart';

class MenuBody extends StatefulWidget {
  final String userName;
  final String userImUrl;
  const MenuBody({
    Key key,
    @required this.height,
    @required this.userName,
    @required this.userImUrl,
  }) : super(key: key);

  final double height;

  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height - 272,
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'Notifcations',
                      icon: Icons.notifications,
                      onTap: () {
                        if (User.userSkipLogIn == false) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Notificatios(),
                            ),
                          );
                        } else {
                          showMyDialog(context: context);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'Settings',
                      icon: Icons.settings,
                      onTap: () {
                        if (User.userSkipLogIn == false) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Settings(),
                            ),
                          );
                        } else {
                          showMyDialog(context: context);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'My Payment',
                      icon: FontAwesomeIcons.idCardAlt,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ComingSoon(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'My Courses',
                      icon: FontAwesomeIcons.bookOpen,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ComingSoon(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'Payment History',
                      icon: FontAwesomeIcons.history,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ComingSoon(),
                          ),
                        );
                      },
                    ),
                    // SizedBox(height: 20),
                    // MenuContent(
                    //   title: 'Coming Soon',
                    //   icon: FontAwesomeIcons.history,
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (_) => ComingSoon(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'Register as consultant',
                      icon: FontAwesomeIcons.registered,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RegisterAsConsultant(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'Contact Us',
                      icon: Icons.phone,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ContatactUs(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'About Us',
                      icon: Icons.info_outlined,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => AboutUS(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    FlatButton.icon(
                      onPressed: () {
                        if (User.userSkipLogIn == true) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => SplashScreen(),
                            ),
                          );
                        } else {
                          setState(
                            () {
                              MySharedPreferences.saveUserUserToken(null);
                            },
                          );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => SplashScreen(),
                            ),
                          );
                        }
                      },
                      icon: Transform.rotate(
                        angle: 180 * 3.14 / 180,
                        child: Icon(
                          Icons.logout,
                          color: customColorIcon,
                        ),
                      ),
                      label: Text(
                        (User.userSkipLogIn == true) ? 'LogIn' : 'Log Out',
                        style: AppTheme.heading.copyWith(
                          color: customColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
