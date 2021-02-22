import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/consultant.dart';
import 'package:DrHwaida/screens/Consultant/conponents/conSultantRating.dart';
import 'package:DrHwaida/screens/myReview/myreview.dart';
import 'package:DrHwaida/screens/scheduleAppo/scheduleAppo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/parser.dart';

import '../CustomBottomNavigationBar.dart';

class ConsultantPageView extends StatefulWidget {
  final Consultant consultant;

  const ConsultantPageView({
    Key key,
    @required this.consultant,
  }) : super(key: key);

  @override
  _ConsultantPageViewState createState() => _ConsultantPageViewState();
}

class _ConsultantPageViewState extends State<ConsultantPageView> {
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.consultant.availableIn.toString());
    return Scaffold(
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
      height: 520,
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
                image: NetworkImage(widget.consultant.image),
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
                            widget.consultant.name,
                            style: AppTheme.heading,
                          ),
                          Text(
                            widget.consultant.experince + ' Exp Yry',
                            style: AppTheme.heading,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    RatingStar(
                                      isReadOnly: true,
                                      rating:
                                          double.parse(widget.consultant.rate),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      widget.consultant.rate,
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
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        widget.consultant.address,
                                        style: AppTheme.heading.copyWith(
                                          fontSize: 10,
                                          color: customColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomButtonWithchild(
                              color: customColor,
                              onPress: () {
                                flitter(
                                  context: context,
                                  child: ConsultantRating(
                                    title: widget.consultant.name,
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  'Review',
                                  style: AppTheme.heading.copyWith(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'About ' + widget.consultant.name,
                        style: AppTheme.heading,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 125,
                        child: ListView(
                          children: [
                            Text(
                              _parseHtmlString(widget.consultant.bio),
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
                                    FontAwesomeIcons.poundSign,
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
                                  (widget.consultant.discount != '0')
                                      ? Text(
                                          widget.consultant.coust + '\$',
                                          style: AppTheme.subHeading.copyWith(
                                            color: customColorIcon,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.consultant.total_coust.toString(),
                                    style: AppTheme.heading.copyWith(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          (widget.consultant.availableIn == null)
                              ? Container()
                              : Expanded(
                                  flex: 2,
                                  child: CustomButtonWithchild(
                                    onPress: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => ScheduleAppo(
                                            consultant: widget.consultant,
                                          ),
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
