import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';

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
    String userImage,
    String userEmail,
  }) async {
    final uri = Uri.parse(Utils.UPDATEUSERDATA_URL).replace(
      queryParameters: <String, String>{
        'name': "$name",
        'age': "$age",
        'gender': "$gender",
        'status': "$status",
        'mobile': "$phoneNummber",
        'image': "$userImage",
        'email': "$userEmail",
      },
    );
    print(uri.toString());

    try {
      var respes = await http.put(
        uri.toString(),
        headers: {'x-api-key': userToken},
      );
      if (respes.statusCode == 200) {
        final data = json.decode(respes.body);
        if (data['success'] != true) {
          print('EROOOOOOOOOOOOOOOOOOOOOOOOOR');
        } else {
          print('succeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeess');
        }
      } else if (respes.statusCode == 201) {
        final data = json.decode(respes.body);
        if (data['success'] != true) {
          print('EROOOOOOOOOOOOOR');
        } else {
          print('succeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeess');
        }
      } else {
        print('ServerErooor');
      }
    } catch (e) {
      print('errrrroe');

      print('catch Error is:' + e.toString());
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
