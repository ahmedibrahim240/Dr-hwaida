import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConsaultantCard extends StatelessWidget {
  const ConsaultantCard({
    Key key,
    @required this.onTap,
    @required this.consultName,
    @required this.location,
    @required this.oldPrice,
    @required this.newPrice,
    @required this.rating,
    @required this.imagUrl,
    @required this.index,
  }) : super(key: key);

  final Function onTap;
  final String consultName;
  final String location;
  final String oldPrice;
  final String newPrice;
  final String rating;
  final String imagUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            elevation: 2,
            child: Row(
              children: [
                consImage(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        consultName,
                        style: AppTheme.heading,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.black38,
                          ),
                          Text(
                            location,
                            style: AppTheme.subHeading
                                .copyWith(color: customColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                oldPrice + '\$',
                                style: AppTheme.subHeading.copyWith(
                                  color: Colors.grey[500],
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                newPrice + '\$',
                                style: AppTheme.heading,
                              ),
                            ],
                          ),
                        ],
                      ),
                      (index == 0)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                consulCardBotom(
                                  title: 'Recent',
                                  color: customColor,
                                ),
                                SizedBox(width: 5),
                                consulCardBotom(
                                  title: 'Selected',
                                  color: Colors.lightBlue,
                                ),
                              ],
                            )
                          : (index == 1)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    consulCardBotom(
                                      title: 'Recent',
                                      color: customColor,
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    consulCardBotom(
                                      title: 'Recent',
                                      color: customColor,
                                    ),
                                    SizedBox(width: 5),
                                    consulCardBotom(
                                      title: 'Selected',
                                      color: Colors.lightBlue,
                                    ),
                                    SizedBox(width: 5),
                                    consulCardBotom(
                                      title: 'Our Stars',
                                      color: Colors.gold,
                                    ),
                                  ],
                                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Container consulCardBotom({String title, Color color}) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          title,
          style: AppTheme.subHeading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container consImage() {
    return Container(
      height: 120,
      width: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            gradient: AppTheme.containerBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.star,
                color: Colors.yellow,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                '$rating K ',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
