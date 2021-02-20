import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameQPageView extends StatefulWidget {
  @override
  _GameQPageViewState createState() => _GameQPageViewState();
}

class _GameQPageViewState extends State<GameQPageView> {
  int slectedAnwser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          Center(
            child: Text(
              'تجد صعوبه في تقديم نفسك لشريكك',
              style: AppTheme.heading.copyWith(),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              answerContainer(0),
              SizedBox(width: 30),
              answerContainer(1),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              answerContainer(2),
              SizedBox(width: 30),
              answerContainer(3),
            ],
          ),
          CustomButtonWithchild(
            onPress: () {},
            color: customColor,
            child: Center(
              child: Text(
                'Sent',
                style: AppTheme.heading.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row answer(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        answerContainer(index),
        SizedBox(width: 30),
        answerContainer(index),
      ],
    );
  }

  Column answerContainer(int index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              slectedAnwser = index;
            });
          },
          child: Card(
            elevation: 3,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/person.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (slectedAnwser == index) ? customColor : Colors.transparent,
          ),
          child: Center(
            child: Icon(
              FontAwesomeIcons.check,
              color:
                  (slectedAnwser == index) ? Colors.white : Colors.transparent,
              size: 10,
            ),
          ),
        ),
      ],
    );
  }
}
