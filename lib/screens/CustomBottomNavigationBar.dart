import 'package:DrHwaida/comingSoon.dart';
import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/visaCard.dart';
import 'package:DrHwaida/screens/userProfile/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Helper.tappedBottomShet = 1;
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => UserProfile(
                              userName: 'Tessting',
                              userimgUrl: 'lib/images/female.png',
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: (Helper.tappedBottomShet == 1)
                                ? customColor
                                : customColorGray,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Profile',
                            style: AppTheme.heading.copyWith(
                              color: (Helper.tappedBottomShet == 1)
                                  ? customColor
                                  : customColorGray,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Helper.tappedBottomShet = 3;
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ComingSoon(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.bookOpen,
                            color: (Helper.tappedBottomShet == 3)
                                ? customColor
                                : customColorGray,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Courses',
                            style: AppTheme.heading.copyWith(
                              color: (Helper.tappedBottomShet == 3)
                                  ? customColor
                                  : customColorGray,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: InkWell(
              onTap: () {
                setState(() {
                  Helper.tappedBottomShet = 2;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ComingSoon(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Helper.tappedBottomShet == 2)
                          ? customColor
                          : customColorGray,
                      image: DecorationImage(
                        image: AssetImage('lib/images/logo.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Harmony Game',
                      style: AppTheme.heading.copyWith(
                        color: (Helper.tappedBottomShet == 2)
                            ? customColor
                            : customColorGray,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
