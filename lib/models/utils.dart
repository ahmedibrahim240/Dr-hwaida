import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
  // ignore: non_constant_identifier_names
  static final BASE_URL =
      "http://technomasrsystems.com/Demos/Others/ShyBeLbn/public/api";
  // ignore: non_constant_identifier_names
  static final Consultant_URL = BASE_URL + "/consultants";
  // ignore: non_constant_identifier_names
  static final REGISTER_URL = BASE_URL + "/clients/register";
  // ignore: non_constant_identifier_names
  static final LOGIN_URL = BASE_URL + "/clients/login";
  // // ignore: non_constant_identifier_names
  // static final REGISTERWITHFACEBOOK_URL = BASE_URL + "/fb-register";
  // // ignore: non_constant_identifier_names
  // static final ProfileData_URL = BASE_URL + "/ProfileDetails";
  // // ignore: non_constant_identifier_names
  // static final Profile_URL = BASE_URL + "/editProfile";
  // // ignore: non_constant_identifier_names
  // static final ACTIVATION_URL = BASE_URL + "/activation";
  // // ignore: non_constant_identifier_names
  // static final PASSWORD_RESET_URL = BASE_URL + "/PasswordReset";
  // // ignore: non_constant_identifier_names
  // static final ABOUT_URL = BASE_URL + "/Pages?PageID=4";
  // // ignore: non_constant_identifier_names
  // static final CONTACT_INFO_URL = BASE_URL + "/GeneralData";
  // // ignore: non_constant_identifier_names
  // static final CONTACT_US_URL = BASE_URL + "/postContactUS";
  // // ignore: non_constant_identifier_names
  // static final HOME_DATA_URL = BASE_URL + "/GeneralData";
  // // ignore: non_constant_identifier_names
  // static final TEAMWORL_URL = BASE_URL + "/TeamWork";
  // // ignore: non_constant_identifier_names
  // static final GALLERY_URL = BASE_URL + "/Gallery";
  // // ignore: non_constant_identifier_names
  // static final VIDEOS_URL = BASE_URL + "/Videos";
  // // ignore: non_constant_identifier_names
  // static final FAQS_URL = BASE_URL + "/FAQs";
  // // ignore: non_constant_identifier_names
  // static final BOOKNOW_URL = BASE_URL + "/BookNow";
  // // ignore: non_constant_identifier_names
}
