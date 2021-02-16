import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/screens/payment/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Card'),
      body: ListView(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CheckOut(),
                ),
              );
            },
            child: Text('Check Out'),
          ),
        ],
      ),
    );
  }
}
