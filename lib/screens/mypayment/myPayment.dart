import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/utils.dart';
import 'package:DrHwaida/models/visaCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPayment extends StatefulWidget {
  @override
  _MyPaymentState createState() => _MyPaymentState();
}

class _MyPaymentState extends State<MyPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: 'My Payment'),
      body: ListView.separated(
        itemCount: Helper.visaCardList.length,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final item = Helper.visaCardList[index];

          return DismissibleWidget(
            item: item,
            child: Card(
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.ccVisa,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              "Card Number",
                              style: AppTheme.subHeading,
                            ),
                            SizedBox(height: 10),
                            Text("Expriy Date"),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${item.cardNumber.substring(0, 3)}*********",
                          style: AppTheme.subHeading,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${item.exDate}",
                          style: AppTheme.subHeading,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            onDismissed: (direction) => dismissItem(context, index, direction),
          );
        },
      ),
    );
  }

  void dismissItem(
      BuildContext context, int index, DismissDirection direction) {
    setState(() {
      Helper.visaCardList.removeAt(index);
    });

    switch (direction) {
      case DismissDirection.endToStart:
        Utils.showSnackBar(context, "deleting_done");
        break;
      default:
        break;
    }
  }
}
