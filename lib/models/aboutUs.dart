import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';

class AboutUS {
  final String imageUrl;
  final String contant;

  AboutUS({this.imageUrl, this.contant});
}

class AboutUSApi {
  static Future<AboutUS> gitAboutUSApi() async {
    AboutUS aboutUS;
    var response = await http.get(Utils.AboutUS_URL,
        headers: {'Accept': 'application/json', 'x-api-key': User.userToken});
    var jsonData = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        aboutUS = AboutUS(
          imageUrl: jsonData['data']['rate_question'],
          contant: jsonData['data']['whatsapp'],
        );
      }
    } catch (e) {
      print(e.toString());
    }
    return aboutUS;
  }
}
