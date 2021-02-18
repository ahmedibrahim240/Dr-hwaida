import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/aboutus/aboutus.dart';
import 'package:DrHwaida/screens/contactus/contactus.dart';
import 'package:DrHwaida/screens/mypayment/myPayment.dart';
import 'package:DrHwaida/screens/notifications/notifications.dart';
import 'package:DrHwaida/screens/paymenthistory/paymentHistory.dart';
import 'package:DrHwaida/screens/settings/settings.dart';
// import 'package:DrHwaida/screens/myReview/myreview.dart';
// import 'package:DrHwaida/screens/mycourses/mycourses.dart';
// import 'package:DrHwaida/screens/paymenthistory/paymentHistory.dart';
// import 'package:DrHwaida/screens/userProfile/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';s

import 'menucontant.dart';

class MenuBody extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      height: height - 272,
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Notificatios(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'Settings',
                      icon: Icons.settings,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Settings(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    MenuContent(
                      title: 'My Payment',
                      icon: FontAwesomeIcons.idCardAlt,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MyPayment(),
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
                            builder: (_) => PaymentHistory(),
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
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton.icon(
              onPressed: () {},
              icon: Transform.rotate(
                angle: 180 * 3.14 / 180,
                child: Icon(
                  Icons.logout,
                  color: customColorIcon,
                ),
              ),
              label: Text(
                'Log Out',
                style: AppTheme.heading.copyWith(
                  color: customColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
