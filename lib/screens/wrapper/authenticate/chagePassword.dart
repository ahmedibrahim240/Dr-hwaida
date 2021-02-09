import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/wrapper/home/home.dart';
import 'package:flutter/material.dart';

class ChagePassrowd extends StatefulWidget {
  @override
  _ChagePassrowdState createState() => _ChagePassrowdState();
}

class _ChagePassrowdState extends State<ChagePassrowd> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureconPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: MyCliper(),
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: AppTheme.containerBackground,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create a new password",
                    style: AppTheme.heading.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: obscurePassword,
                    decoration: textFormInputDecorationForPassword(
                      Icons.visibility_off,
                      'password',
                      () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      obscurePassword,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: obscureconPassword,
                    decoration: textFormInputDecorationForPassword(
                      Icons.visibility_off,
                      'Confirm the password',
                      () {
                        setState(() {
                          obscureconPassword = !obscureconPassword;
                        });
                      },
                      obscureconPassword,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'send',
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Home(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
