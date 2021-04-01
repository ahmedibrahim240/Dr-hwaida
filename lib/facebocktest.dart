import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/models/courses.dart';
import 'package:flutter/material.dart';

class FaceBookTest extends StatefulWidget {
  final String name;
  final String url;

  const FaceBookTest({Key key, this.name, this.url}) : super(key: key);
  @override
  _FaceBookTestState createState() => _FaceBookTestState();
}

class _FaceBookTestState extends State<FaceBookTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              widget.name,
            ),
            // Container(
            //   height: 100,
            //   width: 100,
            //   child: customCachedNetworkImage(
            //     context: context,
            //     url: widget.url,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
