import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/visitApi.dart';
import 'package:DrHwaida/models/visits.dart';
import 'package:DrHwaida/screens/visitshistory/updateVisite.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

FutureBuilder<List<Visits>> gitAllVisist() {
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
                                'Consultant Name: ',
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
                                    'Date: ',
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
                              Row(
                                children: [
                                  Text(
                                    'Time: ',
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
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                'Price: ',
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
                          CustomButtonWithchild(
                            color: customColor,
                            onPress: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => UpdateVisits(
                                    id: snapshot.data[index].consultantId,
                                  ),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Update Schedule date',
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
