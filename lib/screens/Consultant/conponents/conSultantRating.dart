import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ConsultantRating extends StatefulWidget {
  final String title;

  const ConsultantRating({Key key, @required this.title}) : super(key: key);
  @override
  _ConsultantRatingState createState() => _ConsultantRatingState();
}

class _ConsultantRatingState extends State<ConsultantRating> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      children: [
        Container(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Add your rate',
                      style: AppTheme.heading.copyWith(
                        color: customColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.title,
                    style: AppTheme.heading.copyWith(),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: SmoothStarRating(
                      rating: 2.5,
                      size: 25,
                      filledIconData: Icons.star,
                      color: Colors.yellow[700],
                      halfFilledIconData: Icons.star_half,
                      borderColor: Colors.yellow[900],
                      defaultIconData: Icons.star_border,
                      starCount: 5,
                      allowHalfRating: true,
                      spacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: conectedTextFormStyle(
                      lableText: 'Add comment',
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'سؤال سؤال سؤال سؤال',
                      textDirection: TextDirection.ltr,
                      style: AppTheme.heading.copyWith(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: conectedTextFormStyle(
                      lableText: 'Answer',
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButtonWithchild(
                    color: customColor,
                    onPress: () {},
                    child: Center(
                      child: Text(
                        'Rating',
                        style: AppTheme.heading.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
