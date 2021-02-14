import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'components/reviewcontant.dart';

class MyReview extends StatefulWidget {
  @override
  _MyReviewState createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
  String comment = 'Great';
  String title = 'Ahmed Ibrahim';
  String date = 'Today';
  String reviewImageUrl = 'lib/images/person.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My Review'),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ReviewContant(
                    reviewImageUrl: reviewImageUrl,
                    title: title,
                    date: date,
                    comment: comment,
                    onTap: () {},
                  ),
                  Divider(
                    color: customColorDivider,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              );
            },
          ),
          CustomButtonWithchild(
            child: Text(
              'Write a Review',
              style: AppTheme.heading.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            color: customColor,
            onPress: () {},
          )
        ],
      ),
    );
  }
}
