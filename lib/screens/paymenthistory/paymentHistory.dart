import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/screens/CustomBottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/visaCard.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  String visaName = 'Visa';
  String visaNumber = '25555555555555555555555555';
  String date = '2May202';
  String price = '555';
  String userName = 'Ahmed Ibrahim';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Payment History'),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          addCard(context: context, onTap: () {}),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            itemCount: 10,
            itemBuilder: (context, index) {
              return VisaCard(
                visaName: visaName,
                visaNumber: visaNumber,
                date: date,
                price: price,
                userName: userName,
              );
            },
          ),
        ],
      ),
    );
  }
}
