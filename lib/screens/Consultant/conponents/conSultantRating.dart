import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ConsultantRating extends StatefulWidget {
  final String title;
  final String question;
  // ignore: non_constant_identifier_names
  final int consultant_id;

  const ConsultantRating({
    Key key,
    @required this.title,
    @required this.question,

    // ignore: non_constant_identifier_names
    @required this.consultant_id,
  }) : super(key: key);
  @override
  _ConsultantRatingState createState() => _ConsultantRatingState();
}

class _ConsultantRatingState extends State<ConsultantRating> {
  double rate;
  bool loading = false;
  String error = '';
  String coment;
  String anwser;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        children: [
          Container(
            child: Form(
              key: _formKey,
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
                        rating: 0,
                        size: 25,
                        onRated: (val) {
                          setState(() {
                            rate = val;
                          });
                        },
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
                      onChanged: (val) {
                        setState(() {
                          coment = val;
                        });
                      },
                      decoration: conectedTextFormStyle(
                        lableText: 'Add comment',
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        widget.question,
                        textDirection: TextDirection.ltr,
                        style: AppTheme.heading.copyWith(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onChanged: (val) {
                        setState(() {
                          anwser = val;
                        });
                      },
                      validator: (val) =>
                          val.isEmpty ? 'please add your answer' : null,
                      decoration: conectedTextFormStyle(
                        lableText: 'Answer',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(error),
                    SizedBox(height: 10),
                    CustomButtonWithchild(
                      color: customColor,
                      onPress: () {
                        setState(() {
                          loading = !loading;
                        });
                        if (rate != null) {
                          if (_formKey.currentState.validate()) {
                            addRating(
                              answer: anwser,
                              coment: coment,
                              rate: rate,
                              id: widget.consultant_id,
                            );
                          }
                        } else {
                          setState(() {
                            error = 'plesse add your rate';
                          });
                        }
                      },
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
      ),
    );
  }

  addRating({double rate, String coment, String answer, int id}) async {
    try {
      var response = await http.post(
        Utils.RATE_URL,
        body: {
          'consultant_id': id.toString(),
          'rate': rate.toString(),
          'comment': coment.toString(),
          'answer': anwser.toString(),
        },
        headers: {
          'x-api-key': User.userToken,
        },
      );

      Map<String, dynamic> map = json.decode(response.body);

      if (map['success'] == true) {
        _scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: new Text('thank you for rating'),
          ),
        );
      } else {
        print(response.statusCode.toString());
        print(map['message']);
        _scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: new Text('Your rating failed,please try again'),
          ),
        );
      }

      // Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
}
