import 'dart:async';
import 'dart:convert';
import 'package:DrHwaida/constants/constans.dart';
import 'package:DrHwaida/constants/themes.dart';
import 'package:DrHwaida/localization/localization_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class DatabaseServices {
  final String userToken;
  final controller = StreamController<Users>();
  DatabaseServices({this.userToken});
  Map<String, dynamic> map;
  gituserData() async {
    try {
      var response = await http
          .get(Utils.GITUSERDATA_URL, headers: {'x-api-key': userToken});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(response.statusCode.toString());
        final user = _userFromDatabaseUser(data);
        controller.add(user);
      } else if (response.statusCode == 201) {
        final data = json.decode(response.body);

        final user = _userFromDatabaseUser(data);
        controller.add(user);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  upDateUserData({
    String phoneNummber,
    String age,
    String name,
    String gender,
    String status,
    File userImage,
    String userEmail,
    BuildContext context,
  }) async {
    try {
      var data;
      if (userImage != null) {
        String image = userImage.path.split('/').last;
        data = FormData.fromMap({
          "image": await MultipartFile.fromFile(
            userImage.path,
            filename: image,
          ),
          'name': "$name",
          'age': "$age",
          'gender': "$gender",
          'status': "$status",
          'mobile': "$phoneNummber",
          'email': "$userEmail",
        });
      } else {
        data = FormData.fromMap({
          "image": null,
          'name': "$name",
          'age': "$age",
          'gender': "$gender",
          'status': "$status",
          'mobile': "$phoneNummber",
          'email': "$userEmail",
        });
      }
      Dio dio = new Dio();
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        var customHeaders = {
          'x-api-key': userToken,
        };
        options.headers.addAll(customHeaders);
        return options;
      }));

      Response response = await dio.post(Utils.UPDATEUSERDATA_URL, data: data);
      print(response.data.toString());
      if (response.data['success'] != false) {
        showMyDialog(
            context: context, message: getTranslated(context, "savaProChange"));
      } else {
        showMyDialog(context: context, message: response.data['message']);
      }
    } catch (e) {
      print('errrrroe');

      print(e.toString());
    }
  }

  Users _userFromDatabaseUser(Map user) {
    return user != null
        ? Users(
            name: user['data']['name'].toString(),
            userBrDate: user['data']['dob'].toString(),
            phoneNumber: user['data']['mobile'].toString(),
            userGender: user['data']['gender'].toString(),
            userAge: user['data']['age'].toString(),
            userStutes: user['data']['status'].toString(),
            userImageUrl: user['data']['image'],
            email: (user['data']['email'] != null)
                ? user['data']['email'].toString()
                : 'Add Email',
          )
        : null;
  }

  Stream<Users> get userData {
    gituserData();
    return controller.stream;
  }
}

Future<void> showMyDialog({BuildContext context, var message}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                message,
                style: AppTheme.heading.copyWith(
                  color: customColor,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: AppTheme.heading.copyWith(
                color: customColor,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
