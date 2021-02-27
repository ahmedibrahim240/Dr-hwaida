import 'package:DrHwaida/models/user.dart';
import 'package:DrHwaida/models/utils.dart';
import 'package:DrHwaida/models/visits.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VisitsApi {
  static Future<List<Visits>> fetchAllVisit() async {
    List<Visits> listofVisits = [];
    var response = await http.get(Utils.VISITS_URL, headers: {
      'Accept': 'application/json',
      'x-api-key': User.userToken,
    });
    var jsonData = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        for (var itmes in jsonData['data']) {
          Visits visits = Visits(
            id: itmes['id'],
            date: itmes['visits']['available']['date'],
            time: itmes['visits']['available']['time'],
            consultantId: itmes['consultant']['id'],
            name: itmes['consultant']['name'],
          );
          listofVisits.add(visits);
        }
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
    return listofVisits;
  }
}
