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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CheckOut(),
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
              shrinkWrap: true,
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
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          productList.remove(productList[index]);
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
