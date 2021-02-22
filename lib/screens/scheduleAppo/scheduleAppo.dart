import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/consultant.dart';
import 'package:DrHwaida/models/prodact.dart';
import 'package:DrHwaida/screens/cart/cart.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../CustomBottomNavigationBar.dart';

class ScheduleAppo extends StatefulWidget {
  final Consultant consultant;
  const ScheduleAppo({Key key, @required this.consultant}) : super(key: key);
  @override
  _ScheduleAppoState createState() => _ScheduleAppoState();
}

class _ScheduleAppoState extends State<ScheduleAppo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showDate = false;
  bool showTime = false;
  bool showEvenig = false;
  int tappedDate;
  int tappedTime;
  List<AvailableTimes> listTimes = [];
  String _date;
  String _time;
  String _timeID;

  @override
  Widget build(BuildContext context) {
    List<ConsulAvailable> consulAvailable = widget.consultant.available_in;

    return Scaffold(
      appBar: customAppBar(title: 'Schedule Appointment'),
      key: _scaffoldKey,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          children: [
            (widget.consultant.available_in.isEmpty)
                ? Container()
                : Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        rowTitle(
                          title: 'date',
                        ),
                        (widget.consultant.available_in.isEmpty)
                            ? Container()
                            : dateListView(date: consulAvailable),
                        SizedBox(height: 20),
                        (listTimes.isEmpty)
                            ? Container()
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    rowTitle(
                                      title: 'Time',
                                    ),
                                    timeListView(),
                                  ],
                                ),
                              ),
                        (_date == null) ? Container() : Text(_date),
                        (_time == null) ? Container() : Text(_time),
                      ],
                    ),
                  ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButtonWithchild(
                color: customColor,
                onPress: () async {
                  if (_date != null && _time != null) {
                    var _prondet = SaveProduct(
                      date: _date,
                      time: _time,
                      dateId: _timeID,
                      consulId: widget.consultant.id.toString(),
                      title: widget.consultant.name.toString(),
                      price: widget.consultant.total_coust.toString(),
                      proImageUrl: widget.consultant.image.toString(),
                    );
                    Cart.consultProdect.add(_prondet);
                    Cart.saveDataOfConsulPro();
                    _scaffoldKey.currentState.showSnackBar(
                      new SnackBar(
                        content: new Text('Items Was added'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            productConsualtList.remove(_prondet);
                            Cart.saveDataOfConsulPro();
                          },
                        ),
                      ),
                    );
                  } else {
                    _scaffoldKey.currentState.showSnackBar(
                      new SnackBar(
                        content: new Text('you shoud choses  date and time'),
                        // action: SnackBarAction(
                        //   label: 'Undo',
                        //   onPressed: () {
                        //     productConsualtList.remove(_prondet);
                        //   },
                        // ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Add to Cart',
                  style: AppTheme.heading.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container timeListView() {
    return Container(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listTimes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (listTimes[index].date == _date) {
            return timeCard(
              time: listTimes[index].time,
              index: index,
              timeID: listTimes[index].time.toString(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Container dateListView({List<ConsulAvailable> date}) {
    return Container(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: date.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                tappedDate = index;
                listTimes = date[index].availableTimes;
                _date = date[index].date;
              });
            },
            child: Card(
              elevation: 4,
              semanticContainer: false,
              color: tappedDate == index ? customColor : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Date',
                      style: AppTheme.heading.copyWith(
                        color:
                            tappedDate == index ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      date[index].date,
                      style: AppTheme.subHeading.copyWith(
                        color:
                            tappedDate == index ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  timeCard({int index, String time, String timeID}) {
    return InkWell(
      onTap: () {
        setState(() {
          tappedTime = index;
          _timeID = timeID;
          _time = time;
        });
      },
      child: Card(
        elevation: 4,
        color: tappedTime == index ? customColor : Colors.white,
        semanticContainer: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 80,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: tappedTime == index ? Colors.white : Colors.black,
                  size: 35,
                ),
                SizedBox(height: 5),
                Text(
                  time,
                  style: AppTheme.subHeading.copyWith(
                    color: tappedTime == index ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  rowTitle({String title}) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTheme.heading,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_drop_down,
                color: customColor,
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: customColorDivider,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
