import 'package:DrHwaida/constants/constans.dart';
import 'package:flutter/material.dart';
import 'conponents/cinsltantAppBar.dart';
import 'conponents/consultantCard.dart';

class Consultant extends StatefulWidget {
  @override
  _ConsultantState createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
  String consultName = 'Dr.Asmaa Mohamed';
  String location = 'Cairo,Naser City';
  String oldPrice = '550';
  String newPrice = '450';
  String rating = '4.5';

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
          consultantAppBer(context),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 4,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            itemBuilder: (context, index) {
              return ConsaultantCard(
                onTap: () {},
                consultName: consultName,
                location: location,
                oldPrice: oldPrice,
                newPrice: newPrice,
                rating: rating,
              );
            },
          ),
        ],
      ),
    );
  }
}
