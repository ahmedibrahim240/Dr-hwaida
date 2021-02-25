import 'dart:async';
import 'dart:convert';
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';
import 'package:http/http.dart' as http;

class DatabaseServices {
  final String userToken;
  final controller = StreamController<Users>();
  DatabaseServices({this.userToken});
  Map<String, dynamic> map;
  gituserData() async {
    try {
      var response = await http
          .get(Utils.GITUSERDATA_URL, headers: {'x-api-key': userToken});

      final data = json.decode(response.body);

      final user = _userFromDatabaseUser(data);
      controller.add(user);
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
  }) async {
    // var body = jsonEncode({
    //   'name': name,
    //   'mobile': phoneNummber,
    //   'image': userImage,
    //   'age': age,
    //   'gender': gender,
    //   'status': status,
    // });

    final uri = Uri.parse(Utils.UPDATEUSERDATA_URL).replace(
      queryParameters: <String, String>{
        'name': "$name",
        'age': "$age",
        'gender': "$gender",
        'status': "$status",
        'mobile': "$phoneNummber",
        'image': "$userImage",
      },
    );
    print(uri.toString());

    try {
      var respes = await http.put(
        uri.toString(),
        headers: {'x-api-key': userToken},
      );
      final data = json.decode(respes.body);
      if (data['success'] == false) {}
    } catch (e) {
      print('errrrroe');

      print('catch Error is:' + e.toString());
    }
  }

  Users _userFromDatabaseUser(Map user) {
    print(user['data']['name'].toString());
    return user != null
        ? Users(
            name: user['data']['name'].toString(),
            phoneNumber: user['data']['mobile'].toString(),
            userGender: user['data']['gender'].toString(),
            userAge: user['data']['age'].toString(),
            userStutes: user['data']['status'].toString(),
            userImageUrl: user['data']['image'].toString(),
            email: user['data']['email'].toString(),
          )
        : null;
  }

  Stream<Users> get userData {
    gituserData();
    return controller.stream;
  }
}
