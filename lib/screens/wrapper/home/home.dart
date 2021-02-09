import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Home',
          style: AppTheme.heading,
        ),
      ),
    );
  }
}
