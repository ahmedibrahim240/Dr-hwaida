import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  final String stauts;
  static String resStautes;
  const Status({
    Key key,
    this.stauts,
  }) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  String _stauts;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _stauts = 'single';
                          Status.resStautes = _stauts;
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
                              _stauts = 'engaged';
                              Status.resStautes = _stauts;
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _stauts = 'married';
                              Status.resStautes = _stauts;
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
                    SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _stauts = 'detached';
                              Status.resStautes = _stauts;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('lib/images/single.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Divorced',
                          style: AppTheme.heading.copyWith(),
                        ),
                      ],
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
                    (_stauts != null)
                        ? _stauts
                        : (widget.stauts != null)
                            ? widget.stauts
                            : 'Stauts',
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
