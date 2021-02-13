import 'package:DrHwaida/screens/wrapper/authenticate/login.dart';
import 'package:DrHwaida/screens/wrapper/authenticate/signUp/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Container(
        child: LogIn(toggleView: toggleView),
      );
    } else {
      return Container(
        child: SginUp(toggleView: toggleView),
      );
    }
  }
}
