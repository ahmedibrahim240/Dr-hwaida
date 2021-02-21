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
    for (int i = 0; i < productList.length; i++) {
      setState(() {
        totalPrice = totalPrice + double.parse('${productList[i].price}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  itemCount: productList.length,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(productList[index].title),
                        subtitle: Text(
                          productList[index].price + '\$',
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              productList.remove(productList[index]);
                              totalPrice = totalPrice -
                                  double.parse('${productList[index].price}');
                            });
                          },
                        ),
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundImage:
                              AssetImage(productList[index].proImageUrl),
                        ),
                      ),
                    );
                  },
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
