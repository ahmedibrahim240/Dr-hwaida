import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';

class ReviewContant extends StatelessWidget {
  const ReviewContant({
    Key key,
    @required this.reviewImageUrl,
    @required this.title,
    @required this.date,
    @required this.comment,
    @required this.onTap,
  }) : super(key: key);

  final String reviewImageUrl;
  final String title;
  final String date;
  final String comment;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              minRadius: 30,
              backgroundImage: AssetImage(reviewImageUrl),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.heading,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    RatingStar(
                      isReadOnly: true,
                      rating: 4,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      date,
                      style: AppTheme.subHeading,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  comment,
                  style: AppTheme.subHeading,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
