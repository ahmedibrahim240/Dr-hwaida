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
  }) : super(key: key);

  final Function onTap;
  final String consultName;
  final String location;
  final String oldPrice;
  final String newPrice;
  final String rating;
  final String imagUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(imagUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        consultName,
                        style: AppTheme.heading,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.black38,
                          ),
                          SizedBox(width: 10),
                          Text(
                            location,
                            style: AppTheme.subHeading
                                .copyWith(color: customColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
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
                              SizedBox(height: 5),
                              Text(
                                newPrice + '\$',
                                style: AppTheme.heading,
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
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
}
