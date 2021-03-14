import 'dart:convert';

import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';

import 'package:DrHwaida/models/visitApi.dart';
import 'package:DrHwaida/models/visits.dart';
import 'package:DrHwaida/screens/visitshistory/updateVisite.dart';
import 'package:DrHwaida/screens/wrapper/home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

FutureBuilder<List<Visits>> gitAllVisist({BuildContext context}) {
  return FutureBuilder(
    future: VisitsApi.fetchAllVisit(),
    builder: (contant, snapshot) {
      return (snapshot.data == null)
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey[300],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.dollarSign,
                                color: customColor,
                                size: 20,
                              ),
                              Text(
                                snapshot.data[index].payment_method,
                                style: AppTheme.heading,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                getTranslated(context, "title") + ' : ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                ),
                              ),
                              Text(
                                snapshot.data[index].name,
                                style: AppTheme.subHeading.copyWith(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    getTranslated(context, "Date") + ' : ',
                                    style: AppTheme.heading.copyWith(
                                      color: customColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data[index].date,
                                    style: AppTheme.subHeading,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        getTranslated(context, "Time") + ' : ',
                                        style: AppTheme.heading.copyWith(
                                          color: customColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[index].time,
                                        style: AppTheme.subHeading,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        getTranslated(context, "Day") + ' : ',
                                        style: AppTheme.heading.copyWith(
                                          color: customColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[index].day,
                                        style: AppTheme.subHeading,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                getTranslated(context, "Price") + ' : ',
                                style: AppTheme.heading.copyWith(
                                  color: customColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                snapshot.data[index].total_cost.toString(),
                                style: AppTheme.subHeading,
                              ),
                              Icon(
                                FontAwesomeIcons.poundSign,
                                color: Colors.black,
                                size: 10,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomButtonWithchild(
                                  color: customColor,
                                  onPress: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => UpdateVisits(
                                          consultantId:
                                              snapshot.data[index].consultantId,
                                          visitsId: snapshot.data[index].id,
                                          consultant:
                                              snapshot.data[index].consultant,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      getTranslated(context, "update_appoint"),
                                      textAlign: TextAlign.center,
                                      style: AppTheme.heading.copyWith(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CustomButtonWithchild(
                                  color: Colors.red,
                                  onPress: () {
                                    delateVisit(
                                      context: context,
                                      id: snapshot.data[index].id,
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      getTranslated(context, "delate"),
                                      textAlign: TextAlign.center,
                                      style: AppTheme.heading.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            );
    },
  );
}

delateVisit({
  int id,
  BuildContext context,
}) async {
  try {
    var respes = await http.delete(
      Utils.VISITS_URL + "/$id",
      headers: {'x-api-key': User.userToken},
    );
    print(respes.statusCode.toString());
    final data = json.decode(respes.body);
    String sucesseror =
        ' failed to cancel,(We have a server error${data['message']}), Please try again later';
    if (data['success'] != true) {
      showmyDialog(context: context, mass: sucesseror);
    } else {
      showmyDialog(context: context, mass: 'Visit was canceld');
    }
  } catch (e) {
    String catchEroro =
        ' failed to cancel,(We have a server error${e.toString()}), Please try again later';
    showmyDialog(context: context, mass: catchEroro);

    print('catch Error is:' + e.toString());
  }
}

Future<void> showmyDialog({BuildContext context, String mass}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                mass,
                style: AppTheme.heading.copyWith(
                  color: customColor,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Oki',
              style: AppTheme.heading.copyWith(
                color: customColor,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Home()),
              );
            },
          ),
        ],
      );
    },
  );
}
