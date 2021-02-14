import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'components/NotificationsContant.dart';

class Notificatios extends StatefulWidget {
  @override
  _NotificatiosState createState() => _NotificatiosState();
}

class _NotificatiosState extends State<Notificatios> {
  String title = 'Remind For Serial ';
  String date = '20 mim ';
  String contant =
      'Remind For Serial Remind For Serial Remind For Serial Remind For SerialRemind For Serial Remind For Serial Remind For Serial Remind For Serial Remind For SerialRemind For Serial';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Notifications'),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        padding: EdgeInsets.only(
          top: 40,
          right: 8,
          left: 8,
        ),
        children: [
          Text(
            'Today',
            style: AppTheme.heading.copyWith(
              color: Colors.grey[500],
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  NotificationsContant(
                    title: title,
                    contant: contant,
                    date: date,
                    onTap: () {},
                  ),
                  Divider(
                    color: customColorDivider,
                    thickness: 1,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
