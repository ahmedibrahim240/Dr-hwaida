import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:flutter/material.dart';

class CustomMyCoutsesCard extends StatelessWidget {
  const CustomMyCoutsesCard({
    Key key,
    @required this.courses,
    @required this.onTap,
  }) : super(key: key);

  final Courses courses;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      minRadius: 40,
                      backgroundImage: AssetImage(courses.courseImageUrl),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            courses.contant,
                            style: AppTheme.subHeading.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          courses.title,
                          style: AppTheme.heading.copyWith(
                            color: customColor,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          date,
                          style: AppTheme.heading.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingStar(
                      rating: courses.rating,
                      isReadOnly: true,
                    ),
                    Row(
                      children: [
                        Text(
                          courses.oldPrice + '\$',
                          style: AppTheme.heading.copyWith(
                            color: Colors.grey[500],
                            fontSize: 8,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          courses.newPrice + '\$',
                          style: AppTheme.heading.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
