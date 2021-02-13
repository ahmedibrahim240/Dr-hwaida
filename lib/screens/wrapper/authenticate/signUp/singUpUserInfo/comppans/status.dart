import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({
    Key key,
  }) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  String stauts;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showSettingsPanel(
        context: context,
        child: Stack(
          children: [
            CustomAppBar(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Status",
                  style: AppTheme.heading.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          stauts = 'Single';
                        });
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('lib/images/single.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Single',
                            style: AppTheme.heading.copyWith(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              stauts = 'Engaged';
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('lib/images/engaged.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Engaged',
                          style: AppTheme.heading.copyWith(),
                        ),
                      ],
                    ),
                    // SizedBox(width: 10),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          stauts = 'Married';
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/images/married.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 5),
                    Text(
                      'Married',
                      style: AppTheme.heading.copyWith(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: customColor),
        ),
        child: Container(
          height: 40,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'lib/images/status.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    stauts ?? 'Status',
                    style: AppTheme.heading.copyWith(
                      color: customColor,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: customColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
