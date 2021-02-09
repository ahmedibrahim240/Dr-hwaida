import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:vanillia/constants/constans.dart';
// import 'package:vanillia/constants/themes.dart';
// import 'package:vanillia/localization/language_constants.dart';
// import 'package:vanillia/services/auth.dart';
// import 'package:vanillia/services/helper.dart';

// ignore: must_be_immutable
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  bool next = false;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String name = '';
  String userImageUrl =
      'https://img.icons8.com/pastel-glyph/2x/person-male.png';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';
  String error = '';
  List<String> _listCity = [
    'المنصورة',
    'القاهرة',
    'الاسكندرية',
    'الاسماعلية',
  ];
  List<DropdownMenuItem<String>> _dropDownItems1;
  String _selectedItems1;
  bool obscurePassword = true;
  bool obscureconPassword = true;
  @override
  void initState() {
    super.initState();
    _dropDownItems1 = buildDropDwonNemuItems(_listCity);
    _selectedItems1 = _dropDownItems1[0].value;
  }

  List<DropdownMenuItem<String>> buildDropDwonNemuItems(List<String> list) {
    List<DropdownMenuItem<String>> items = List();
    for (var item in list) {
      items.add(
        DropdownMenuItem(
          value: item,
          child: Text(item),
        ),
      );
    }
    return items;
  }

  onChanged(String selectedItems) {
    setState(() {
      _selectedItems1 = selectedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: (widget.next)
          ? userData(width)
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Join us",
                              style: AppTheme.heading.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // TextFormField(
                              //   style: TextStyle(color: Colors.white),
                              //   validator: (val) => val.isEmpty
                              //       ? 'please enter your name'
                              //       : null,
                              //   onChanged: (val) {
                              //     setState(() {
                              //       name = val;
                              //     });
                              //   },
                              //   decoration: textFormInputDecoration(
                              //     Icons.person,
                              //     'name',
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                validator: (val) => val.isEmpty
                                    ? 'please enter your phone number'
                                    : null,
                                onChanged: (val) {
                                  setState(() {
                                    phoneNumber = val;
                                  });
                                },
                                decoration: textFormInputDecoration(
                                  Icons.phone,
                                  "Phone number",
                                ),
                              ),
                              SizedBox(height: 10),
                              // TextFormField(
                              //   style: TextStyle(color: Colors.white),
                              //   validator: (val) => val.isEmpty
                              //       ? 'please enter an email'
                              //       : null,
                              //   decoration: textFormInputDecoration(
                              //     Icons.email,
                              //     'email',
                              //   ),
                              //   onChanged: (val) {
                              //     setState(
                              //       () {
                              //         email = val;
                              //       },
                              //     );
                              //   },
                              // ),
                              // SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
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
                                // validator: (val) => validatePassord(val),
                                obscureText: obscurePassword,
                                onChanged: (val) {
                                  // setState(() {
                                  //   password = val;
                                  // });
                                },
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: textFormInputDecorationForPassword(
                                  Icons.visibility_off,
                                  "Confirm the password",
                                  () {
                                    setState(() {
                                      obscureconPassword = !obscureconPassword;
                                    });
                                  },
                                  obscureconPassword,
                                ),
                                validator: (val) => validateConfrimPassord(
                                    val, password, confirmPassword),
                                obscureText: obscureconPassword,
                                onChanged: (val) {
                                  setState(() {
                                    confirmPassword = val;
                                  });
                                },
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'choose city',
                                    style: AppTheme.heading.copyWith(),
                                  ),
                                  SizedBox(width: 50),
                                  DropdownButton(
                                    style: AppTheme.heading.copyWith(
                                      color: Colors.white,
                                    ),
                                    elevation: 0,
                                    // value: _selectedItems1,
                                    hint: Text(
                                      _selectedItems1,
                                      style: AppTheme.heading
                                          .copyWith(color: customColor),
                                    ),
                                    dropdownColor: customColor,
                                    focusColor: Colors.white,
                                    isDense: true,
                                    underline: Container(
                                      height: 2,
                                      color: Colors.grey[300],
                                    ),
                                    iconEnabledColor: customColor,
                                    iconSize: 25,
                                    items: _dropDownItems1,
                                    onChanged: onChanged,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              CustomButton(
                                onPress: () {
                                  setState(() {
                                    widget.next = !widget.next;
                                  });
                                },
                                text: 'Next',
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "I dont have an account!",
                                    style: AppTheme.heading.copyWith(),
                                  ),
                                  InkWell(
                                    onTap: () => widget.toggleView(),
                                    child: Text(
                                      'Login?',
                                      style: AppTheme.heading.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                error,
                                style: AppTheme.heading.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
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
                              SizedBox(height: 10),
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

  String validatePassord(String val) {
    if (val.isEmpty) {
      return 'please enter a password';
    } else if (val.length < 6) {
      return 'the password should be at least 6 character';
    } else {
      return null;
    }
  }

  String validateConfrimPassord(
    String val,
    String password,
    String confrimPassord,
  ) {
    if (val.isEmpty) {
      return 'please enter a password';
    } else if (password != confirmPassword) {
      return 'password not matching';
    } else {
      return null;
    }
  }

  userData(width) {
    return Stack(
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
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              // color: Colors.amber,
            ),
            onPressed: () {
              setState(
                () {
                  widget.next = !widget.next;
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Join us",
                      style: AppTheme.heading.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (val) =>
                            val.isEmpty ? 'please enter your name' : null,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        decoration: textFormInputDecoration(
                          Icons.person,
                          'name',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        validator: (val) => val.isEmpty
                            ? 'please enter your phone number'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            phoneNumber = val;
                          });
                        },
                        decoration: textFormInputDecoration(
                          Icons.phone,
                          "Age",
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: customColor,
                          ),
                          Text(
                            'choose city',
                            style: AppTheme.heading.copyWith(),
                          ),
                          SizedBox(width: 50),
                          DropdownButton(
                            style: AppTheme.heading.copyWith(
                              color: Colors.white,
                            ),
                            elevation: 0,
                            // value: _selectedItems1,
                            hint: Text(
                              _selectedItems1,
                              style:
                                  AppTheme.heading.copyWith(color: customColor),
                            ),
                            dropdownColor: customColor,
                            focusColor: Colors.white,
                            isDense: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey[300],
                            ),
                            iconEnabledColor: customColor,
                            iconSize: 25,
                            items: _dropDownItems1,
                            onChanged: onChanged,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        onPress: () {
                          setState(() {
                            widget.next = !widget.next;
                          });
                        },
                        text: 'Sign Up',
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
