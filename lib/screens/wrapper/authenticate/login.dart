import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/passwordRecovery.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogIn extends StatefulWidget {
  final Function toggleView;
  LogIn({this.toggleView});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // DatabaseServices _databaseServices = DatabaseServices();

  // final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  // String email = '';
  // String password = '';
  // String error = '';
  bool loading = false;
  bool obscurePassword = true;
  // saveUserLogInINfo(String email, String pasword) {
  //   DBHelper.saveUserSingIn(true);
  //   QuerySnapshot _snapshot;
  //   _databaseServices.getUserByUseremail(email).then(
  //     (val) {
  //       setState(() {
  //         _snapshot = val;
  //       });
  //       DBHelper.saveUserUserName(_snapshot.documents[0].data['name']);
  //       DBHelper.saveUserImageUrl(_snapshot.documents[0].data['userImageUrl']);
  //       DBHelper.saveUserUserEmail(_snapshot.documents[0].data['email']);
  //       DBHelper.saveUserUserPassrod(pasword);
  //       DBHelper.saveUserUserPhoneNumber(
  //           _snapshot.documents[0].data['phoneNamber']);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: (loading)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: MyCliper(),
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: AppTheme.containerBackground,
                      ),
                      child: Center(
                        child: Text(
                          'welcome',
                          style: AppTheme.heading.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: textFormInputDecoration(
                                  Icons.phone,
                                  'Phome Number',
                                ),
                                // validator: (val) =>
                                //     val.isEmpty ? 'please enter an email' : null,
                                // onChanged: (val) {
                                //   setState(() {
                                //     email = val;
                                //   });
                                // },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: textFormInputDecorationForPassword(
                                  Icons.visibility_off,
                                  'password',
                                  () {
                                    // setState(() {
                                    //   obscurePassword = !obscurePassword;
                                    // });
                                  },
                                  obscurePassword,
                                ),
                                // validator: (val) =>
                                //     val.isEmpty ? 'please enter a password' : null,
                                // obscureText: obscurePassword,
                                // onChanged: (val) {
                                //   setState(() {
                                //     password = val;
                                //   });
                                // },
                              ),
                              SizedBox(height: 20),
                              CustomButton(
                                onPress: () {},
                                text: 'Log In',
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'forget ',
                                    style: AppTheme.heading.copyWith(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => PasswordRecovery(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'password?',
                                      style: AppTheme.heading.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              // Text(
                              //   error,
                              //   style:
                              //       AppTheme.heading.copyWith(color: Colors.white),
                              // ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 1,
                                    width: width * .3,
                                    color: customColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'or',
                                    style: AppTheme.heading.copyWith(),
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    height: 1,
                                    width: width * .3,
                                    color: customColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              CustomButtonWithchild(
                                onPress: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Sign in with Google',
                                      style: AppTheme.heading.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                color: Colors.redAccent,
                              ),
                              CustomButtonWithchild(
                                onPress: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Sign in with FaceBook',
                                      style: AppTheme.heading.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                color: Colors.blueAccent,
                              ),
                              SizedBox(height: 20),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "I dont have an account!",
                                        style: AppTheme.heading.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => widget.toggleView(),
                                        child: Text(
                                          "Sign Up?",
                                          style: AppTheme.heading.copyWith(
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
