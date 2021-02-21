import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/prodact.dart';
import 'package:DrHwaida/screens/checkOut/checkOut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../CustomBottomNavigationBar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalPrice = 0.0;
  @override
  void initState() {
    culcTotalPrice();
    super.initState();
  }

  culcTotalPrice() {
    for (int i = 0; i < productConsualtList.length; i++) {
      setState(() {
        totalPrice =
            totalPrice + double.parse('${productConsualtList[i].price}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (productConsualtList.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: (Text(
            'Cart',
            style: AppTheme.heading.copyWith(
              color: Colors.white,
            ),
          )),
        ),
        body: Center(
          child: Text(
            'isEmpty',
            style: AppTheme.heading.copyWith(
              color: customColor,
              fontSize: 20,
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: (Text(
            'Cart',
            style: AppTheme.heading.copyWith(
              color: Colors.white,
            ),
          )),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView(
                shrinkWrap: true,
                primary: true,
                children: [
                  SizedBox(height: 20),
                  totalPrieCard(context),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: productConsualtList.length,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          child: Column(
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      'title: ',
                                      style: AppTheme.heading.copyWith(
                                        color: customColor,
                                      ),
                                    ),
                                    Text(
                                      productConsualtList[index].title,
                                      style: AppTheme.subHeading.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Price: ',
                                          style: AppTheme.heading.copyWith(
                                            color: customColor,
                                          ),
                                        ),
                                        Text(
                                          productConsualtList[index].price,
                                          style: AppTheme.subHeading.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.poundSign,
                                          color: Colors.black,
                                          size: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      totalPrice = totalPrice -
                                          double.parse(
                                              '${productConsualtList[index].price}');
                                      productConsualtList
                                          .remove(productConsualtList[index]);
                                    });
                                  },
                                ),
                                leading: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: AssetImage(
                                      productConsualtList[index].proImageUrl),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Date: ',
                                              style: AppTheme.heading.copyWith(
                                                color: customColor,
                                              ),
                                            ),
                                            Text(
                                              productConsualtList[index].date,
                                              style:
                                                  AppTheme.subHeading.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Icon(
                                              FontAwesomeIcons.poundSign,
                                              color: Colors.black,
                                              size: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Time: ',
                                              style: AppTheme.heading.copyWith(
                                                color: customColor,
                                              ),
                                            ),
                                            Text(
                                              productConsualtList[index].time,
                                              style:
                                                  AppTheme.subHeading.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Icon(
                                              FontAwesomeIcons.poundSign,
                                              color: Colors.black,
                                              size: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
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

  Container totalPrieCard(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: customColor),
        ),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Total Price: ',
                    style: AppTheme.subHeading.copyWith(),
                  ),
                  Text(
                    totalPrice.toString(),
                    style: AppTheme.subHeading.copyWith(
                      color: customColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: FlatButton.icon(
                  color: customColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CheckOut(
                          totalPrice: totalPrice.toString(),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.moneyCheckAlt,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    'Check Out',
                    style: AppTheme.subHeading.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
