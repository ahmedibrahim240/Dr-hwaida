import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: customAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                ),
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
                          child: TextFormField(
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            initialValue: '22 years',
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
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            initialValue: 'single',
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
                                    Icons.family_restroom,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: 'female',
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
                              FontAwesomeIcons.female,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Transform.rotate(
                        angle: 180 * 3.14 / 180,
                        child: Icon(
                          Icons.logout,
                          color: customColorIcon,
                        ),
                      ),
                      label: Text(
                        'Log Out',
                        style: AppTheme.heading.copyWith(
                          color: customColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
    return Hero(
      tag: 'userImg$userimgUrl',
      child: Center(
        child: Container(
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
            child: GestureDetector(
              onTap: onTap,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.userEdit,
                  color: customColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
