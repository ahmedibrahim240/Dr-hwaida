import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/events.dart';
import 'package:DrHwaida/screens/checkOut/checkOut.dart';
import 'package:flutter/material.dart';
import '../CustomBottomNavigationBar.dart';

class EventsPageView extends StatefulWidget {
  final CustomEvent events;

  const EventsPageView({Key key, @required this.events}) : super(key: key);
  @override
  _EventsPageViewState createState() => _EventsPageViewState();
}

class _EventsPageViewState extends State<EventsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.events.imageUl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.events.title,
                          style: AppTheme.heading.copyWith(
                            color: customColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.events.contant +
                            widget.events.contant +
                            widget.events.contant +
                            widget.events.contant +
                            widget.events.contant +
                            widget.events.contant +
                            widget.events.contant +
                            widget.events.contant,
                        textAlign: TextAlign.start,
                        style: AppTheme.subHeading.copyWith(
                          height: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: CustomButtonWithchild(
                          color: customColor,
                          onPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CheckOut(),
                              ),
                            );
                          },
                          child: Text(
                            'Booking Naw',
                            style:
                                AppTheme.heading.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
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
