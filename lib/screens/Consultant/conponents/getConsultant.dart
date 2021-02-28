import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/consultant.dart';
import 'package:DrHwaida/models/consultantApi.dart';
import 'package:DrHwaida/screens/consultantPageView/consultantPageView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

FutureBuilder<List<Consultant>> getAllConsultant() {
  return FutureBuilder(
    future: ConsultantApi.fetchAllConsultant(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return (snapshot.data == null)
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ConsultantPageView(
                                consultant: snapshot.data[index],
                                consulId: snapshot.data[index].id,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            children: [
                              consImage(
                                  imgUrl: snapshot.data[index].image,
                                  rate:
                                      double.parse(snapshot.data[index].rate)),
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
                                      snapshot.data[index].name,
                                      style: AppTheme.heading,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.black38,
                                        ),
                                        Text(
                                          snapshot.data[index].address,
                                          style: AppTheme.subHeading
                                              .copyWith(color: customColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            (snapshot.data[index].discount !=
                                                    '0')
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        snapshot
                                                            .data[index].coust,
                                                        style: AppTheme
                                                            .subHeading
                                                            .copyWith(
                                                          color:
                                                              Colors.grey[500],
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      ),
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .poundSign,
                                                        color: Colors.grey[500],
                                                        size: 10,
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data[index].total_coust
                                                      .toString(),
                                                  style: AppTheme.heading,
                                                ),
                                                Icon(
                                                  FontAwesomeIcons.poundSign,
                                                  color: Colors.grey[500],
                                                  size: 10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    (snapshot.data[index].badges == null)
                                        ? Container()
                                        : listOfBadges(
                                            badges: snapshot.data[index].badges,
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
                },
              );
      } else {
        return Align(
          alignment: Alignment.center,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    },
  );
}

listOfBadges({List badges}) {
  String selected = 'selected_badge';
  String recent = 'recent_badge';
  String ourstars = 'our_stars_badge';
  String certificated = 'certificated';
  return Container(
    height: 100,
    child: ListView.builder(
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.horizontal,
      itemCount: badges.length,
      itemBuilder: (context, index) {
        if (badges[index] == selected) {
          return Row(
            children: [
              consulCardBotom(
                title: 'Selected',
                color: Colors.lightBlue,
              ),
              SizedBox(width: 2),
            ],
          );
        } else if (badges[index] == recent) {
          return Row(
            children: [
              consulCardBotom(
                title: 'Recent',
                color: Colors.greenAccent,
              ),
              SizedBox(width: 2),
            ],
          );
        } else if (badges[index] == ourstars) {
          return Row(
            children: [
              consulCardBotom(
                title: 'Our Stars',
                color: Colors.gold,
              ),
              SizedBox(width: 2),
            ],
          );
        } else if (badges[index] == certificated) {
          return Row(
            children: [
              consulCardBotom(
                title: 'DD Certificated',
                color: customColor,
              ),
              SizedBox(width: 2),
            ],
          );
        } else {
          return Container();
        }
      },
    ),
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

Container consImage({String imgUrl, double rate}) {
  return Container(
    height: 120,
    width: 130,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(imgUrl),
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
              '$rate K ',
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
