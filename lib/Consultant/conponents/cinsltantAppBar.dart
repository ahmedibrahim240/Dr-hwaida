import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConsultantAppBer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: AppTheme.containerBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: 180 * 3.14 / 365,
                child: SvgPicture.asset(
                  "assets/icons/filter.svg",
                  color: Colors.white,
                  height: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
