import 'package:flutter/cupertino.dart';

class VisaCard {
  final String cardNumber;
  final String exDate;
  final String cVV;
  final int index;

  VisaCard({
    @required this.cardNumber,
    @required this.exDate,
    @required this.cVV,
    @required this.index,
  });
}

class Helper {
  static String chossenDate = '';
  static bool status = false;
  static int cardConut = 0;
  static int tappedBottomShet;

  static List<VisaCard> visaCardList = [
    VisaCard(
      cardNumber: '333333333333333',
      exDate: '02/2021',
      cVV: '2121',
      index: Helper.cardConut,
    ),
    VisaCard(
      cardNumber: '333333333333333',
      exDate: '02/2021',
      cVV: '2121',
      index: Helper.cardConut,
    ),
    VisaCard(
      cardNumber: '333333333333333',
      exDate: '02/2021',
      cVV: '2121',
      index: Helper.cardConut,
    ),
    VisaCard(
      cardNumber: '333333333333333',
      exDate: '02/2021',
      cVV: '2121',
      index: Helper.cardConut,
    ),
  ];
}
