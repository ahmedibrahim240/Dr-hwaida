import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/courses/components/coursesfillter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container consultantAppBer(BuildContext context, String title) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      gradient: AppTheme.containerBackground,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        Text(
          title,
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            flitter(
              context: context,
              child: CoursesFillter(
                title: title,
              ),
            );
          },
          icon: Transform.rotate(
            angle: 180 * 3.14 / 365,
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              color: Colors.white,
              height: 25,
            ),
          ),
        ),
      ],
    ),
  );
}
