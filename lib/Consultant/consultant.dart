import 'package:DrHwaida/constants/constans.dart';
import 'package:flutter/material.dart';

import 'conponents/cinsltantAppBar.dart';

class Consultant extends StatefulWidget {
  @override
  _ConsultantState createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          ConsultantAppBer(),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    elevation: 4,
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
