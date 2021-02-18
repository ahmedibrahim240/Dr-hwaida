import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/models/visaCard.dart';
import 'package:DrHwaida/screens/settings/settings.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/signUp/singUpUserInfo/components/age.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/signUp/singUpUserInfo/components/gender.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/signUp/singUpUserInfo/components/status.dart';
import 'package:DrHwaida/screens/wrapper/home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../CustomBottomNavigationBar.dart';

class UserProfile extends StatefulWidget {
  final String userName;
  final String userimgUrl;

  UserProfile({@required this.userName, @required this.userimgUrl});
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: (Text(
          'Profile',
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Settings(),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        leading: (IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Helper.tappedBottomShet = 0;
            });
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
            );
          },
        )),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 40,
            ),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserPorfileImage(
                    onTap: () {},
                    userimgUrl: widget.userimgUrl,
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.userName,
                    style: AppTheme.heading.copyWith(
                      fontSize: 20,
                      color: customColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: widget.userName,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                        ),
                        prefixIcon: Container(
                          margin: EdgeInsets.all(8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: AppTheme.containerBackground,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: '0100002580',
                      readOnly: true,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Settings(),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                        ),
                        prefixIcon: Container(
                          margin: EdgeInsets.all(8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: AppTheme.containerBackground,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Status(
                            stauts: 'Single',
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Age(
                            age: '22',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Gender(
                      gender: 'Fimale',
                    ),
                  ],
                ),
              ),
            ],
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

class UserPorfileImage extends StatelessWidget {
  const UserPorfileImage({
    Key key,
    @required this.onTap,
    @required this.userimgUrl,
  }) : super(key: key);

  final Function onTap;
  final String userimgUrl;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 190 * 3.14 / 97,
      child: Hero(
        tag: 'userImg$userimgUrl',
        child: Center(
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: customColor,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(2),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(userimgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      gradient: AppTheme.containerBackground,
                    ),
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.edit,
                        color: Colors.white,
                        size: 15,
                      ),
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
