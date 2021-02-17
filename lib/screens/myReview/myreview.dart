import 'package:DrHwaida/constants/constans.dart';
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
      body: Container(
        child: reviewsList(),
      ),
    );
  }

  ListView reviewsList() {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      children: [
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 10,
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
                  height: 5,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
