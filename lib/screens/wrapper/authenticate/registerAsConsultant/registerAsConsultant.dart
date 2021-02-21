import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';

class RegisterAsConsultant extends StatefulWidget {
  @override
  _RegisterAsConsultantState createState() => _RegisterAsConsultantState();
}

class _RegisterAsConsultantState extends State<RegisterAsConsultant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: conectedTextFormStyle(
                    lableText: 'Name',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: conectedTextFormStyle(
                    lableText: 'Email',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: conectedTextFormStyle(
                    lableText: 'Phone',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: conectedTextFormStyle(
                    lableText: 'Address',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: conectedTextFormStyle(
                    lableText: 'About yourself',
                  ),
                ),
              ],
            ),
          ),
          CustomButtonWithchild(
            color: customColor,
            onPress: () {},
            child: Center(
              child: Text(
                'Register',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
