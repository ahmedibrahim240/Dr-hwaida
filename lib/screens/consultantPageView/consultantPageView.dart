import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/myReview/myreview.dart';
import 'package:DrHwaida/screens/scheduleAppo/scheduleAppo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../CustomBottomNavigationBar.dart';

class ConsultantPageView extends StatefulWidget {
  final String consultName;
  final String location;
  final String oldPrice;
  final String newPrice;
  final String rating;
  final String imagUrl;

  const ConsultantPageView({
    Key key,
    @required this.consultName,
    @required this.location,
    @required this.oldPrice,
    @required this.newPrice,
    @required this.rating,
    @required this.imagUrl,
  }) : super(key: key);

  @override
  _ConsultantPageViewState createState() => _ConsultantPageViewState();
}

class _ConsultantPageViewState extends State<ConsultantPageView> {
  String contant =
      'developed to integrate the features included in developed to integrate the features included in developed to integrate the features included in developed to integrate the features included in developed to integrate the features included in developed to integrate the features included in developed to integrate the features included in developed to integrate the features included in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: customColor,
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            primary: true,
            children: [
              consultantData(context),
              Container(
                height: 1100,
                color: Colors.amber,
                child: MyReview(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Container consultantData(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(widget.imagUrl),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.consultName,
                            style: AppTheme.heading,
                          ),
                          Text(
                            '7 Exp Yry',
                            style: AppTheme.heading,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          RatingStar(
                            isReadOnly: true,
                            rating: 4,
                          ),
                          SizedBox(width: 10),
                          Text(
                            widget.rating,
                            style: AppTheme.heading.copyWith(
                              color: customColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.black38,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            widget.location,
                            style: AppTheme.heading.copyWith(
                              color: customColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'About ' + widget.consultName,
                        style: AppTheme.heading,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 125,
                        child: ListView(
                          children: [
                            Text(
                              contant + contant,
                              style: AppTheme.subHeading,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.dollarSign,
                                    color: Colors.black38,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Price',
                                    style: AppTheme.heading
                                        .copyWith(color: customColor),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    widget.oldPrice + '\$',
                                    style: AppTheme.subHeading.copyWith(
                                      color: customColorIcon,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.newPrice + '\$',
                                    style: AppTheme.heading.copyWith(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomButtonWithchild(
                              onPress: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ScheduleAppo(),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  'Schedule \n Appointment',
                                  textAlign: TextAlign.center,
                                  style: AppTheme.heading.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              color: customColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
