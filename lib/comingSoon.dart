import 'package:DrHwaida/constants/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/themes.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.containerBackground,
                image: DecorationImage(
                  image: AssetImage('lib/images/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Coming Soon.......',
              style: AppTheme.heading.copyWith(
                color: customColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
