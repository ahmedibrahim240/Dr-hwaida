import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(title: 'settings'),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 30),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: customColor,
                ),
                SizedBox(width: 5),
                Text(
                  'account',
                  style: AppTheme.heading,
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 20),
            acountBody(title: 'Change password', onTap: () {}),
            SizedBox(height: 20),
            acountBody(title: 'Add Phone Number', onTap: () {}),
            SizedBox(height: 20),
            acountBody(title: 'Add Email', onTap: () {}),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.app_settings_alt,
                  color: customColor,
                ),
                SizedBox(width: 5),
                Text(
                  'App Settings',
                  style: AppTheme.heading,
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 20),
            lan(),
            Divider(
              height: 15,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector acountBody({String title, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTheme.heading,
          ),
          Transform.rotate(
            angle: 180 * 3.14 / 180,
            child: Icon(
              Icons.arrow_back_ios,
              color: customColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget lan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'language',
          style: AppTheme.heading,
        ),
        // DropdownButton<Language>(
        //   dropdownColor: Colors.white,
        //   underline: SizedBox(),
        //   icon: Icon(
        //     Icons.language,
        //     color: Colors.lightBlueAccent,
        //   ),
        //   onChanged: (Language language) {
        //     _changeLanguage(language);
        //   },
        //   items: Language.languageList()
        //       .map<DropdownMenuItem<Language>>(
        //         (e) => DropdownMenuItem<Language>(
        //           value: e,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: <Widget>[
        //               Text(
        //                 e.flag,
        //                 style: TextStyle(fontSize: 30),
        //               ),
        //               Text(e.name)
        //             ],
        //           ),
        //         ),
        //       )
        //       .toList(),
        // ),
      ],
    );
  }
}
