import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DrHwaida/models/utils.dart';

class AboutUS {
  final String imageUrl;
  final String contant;

  AboutUS({this.imageUrl, this.contant});
}

class AboutUSApi {
  static Future<AboutUS> gitAboutUSApi() async {
    AboutUS aboutUS;
    var response = await http.get(
      Utils.AboutUS_URL,
    );
    var jsonData = json.decode(response.body);
    print(jsonData);
    print(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        print('succ:' + response.statusCode.toString());

        aboutUS = AboutUS(
          imageUrl: jsonData['data']['image'],
          contant: jsonData['data']['about'],
        );
      }
    } catch (e) {
      print('cath:' + response.statusCode.toString());
      print(e.toString());
    }
    return aboutUS;
  }
}
