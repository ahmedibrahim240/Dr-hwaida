import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContatactUs extends StatefulWidget {
  @override
  _ContatactUsState createState() => _ContatactUsState();
}

class _ContatactUsState extends State<ContatactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'contact Us'),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/images/aboutus.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: conectedTextFormStyle(lableText: 'Name'),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    decoration: conectedTextFormStyle(lableText: 'Email'),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    maxLines: null,
                    decoration: conectedTextFormStyle(lableText: 'Massage'),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Contact Us ',
                    style: AppTheme.heading.copyWith(
                      color: customColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customSocialMdiaBottom(
                          onTap: () {},
                          icon: FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        customSocialMdiaBottom(
                          onTap: () {},
                          icon: FontAwesomeIcons.whatsapp,
                          color: Colors.greenAccent,
                        ),
                        customSocialMdiaBottom(
                          onTap: () {},
                          icon: FontAwesomeIcons.twitter,
                          color: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  CustomButtonWithchild(
                    color: customColor,
                    child: Text(
                      'Submit',
                      style: AppTheme.heading.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    onPress: () {},
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      'Thanh You! ',
                      style: AppTheme.heading.copyWith(
                        color: Colors.black38,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
