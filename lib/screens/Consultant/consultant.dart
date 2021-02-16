import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/screens/consultantPageView/consultantPageView.dart';
import 'package:flutter/material.dart';
import '../CustomBottomNavigationBar.dart';
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
  String imgUrl = 'lib/images/person.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 50,
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    consultantAppBer(context),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 30,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      itemBuilder: (context, index) {
                        return ConsaultantCard(
                          index: index,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ConsultantPageView(
                                  consultName: consultName,
                                  location: location,
                                  oldPrice: oldPrice,
                                  newPrice: newPrice,
                                  rating: rating,
                                  imagUrl: imgUrl,
                                ),
                              ),
                            );
                          },
                          consultName: consultName,
                          location: location,
                          oldPrice: oldPrice,
                          newPrice: newPrice,
                          rating: rating,
                          imagUrl: imgUrl,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
