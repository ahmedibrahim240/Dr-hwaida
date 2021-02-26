import 'package:DrHwaida/models/consultant.dart';
import 'package:DrHwaida/models/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'consulRate.dart';

class ConsultantApi {
  static Future<List<Consultant>> fetchAllConsultant() async {
    List<Consultant> listOfConsultant = [];
    List<AvailableTimes> listOfTime = [];
    List<ConsulAvailable> listOfConsulAvailable = [];
    var response = await http
        .get(Utils.Consultant_URL, headers: {'Accept': 'application/json'});
    var jsonData = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        for (var itmes in jsonData['data']) {
          listOfConsulAvailable = [];
          listOfTime = [];
          if (itmes['available_in'] != null) {
            for (var item in itmes['available_in']) {
              for (var i in item['times']) {
                AvailableTimes times = AvailableTimes(
                  id: i['id'],
                  date: i['date'],
                  time: i['time'],
                );
                listOfTime.add(times);
              }
              ConsulAvailable consulAvailable = ConsulAvailable(
                  availableTimes: listOfTime, date: item['date']);
              listOfConsulAvailable.add(consulAvailable);
            }
          }

          Consultant consultant = Consultant(
            id: itmes['id'],
            name: itmes['name'],
            bio: itmes['bio'],
            address: itmes['address'],
            image: itmes['image'],
            experince: itmes['experince'],
            coust: itmes['cost'],
            discount: itmes['discount'],
            total_coust: double.parse(itmes['total_cost'].toString()),
            rate: itmes['rate'],
            available_in: listOfConsulAvailable,
            availableIn: itmes['available_in'],
            mapLink: itmes['map_link'],
            badges: itmes['badges'],
            question: itmes['question'],
          );

          listOfConsultant.add(consultant);
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return listOfConsultant;
  }
}

class ConsultantRateApi {
  static Future<List<ConsulRateing>> fetchAllConsultantRate(int id) async {
    List<ConsulRateing> listOfConsultantRating = [];
    // List<RatingUser> listOfUsers = [];

    var response = await http.get(
        "http://technomasrsystems.com/Demos/Others/ShyBeLbn/public/api/consultants/$id/rates",
        headers: {'Accept': 'application/json'});
    var jsonData = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        for (var itmes in jsonData['data']) {
          ConsulRateing consulRateing = ConsulRateing(
            comment: itmes['comment'],
            rate: itmes['rate'],
            name: itmes['user']['name'],
            gender: itmes['user']['gender'],
            image: itmes['user']['image'],
            created_at: itmes['created_at'],
          );
          listOfConsultantRating.add(consulRateing);
          print('coment:::::' + itmes['comment']);
        }
      } else {
        print(response.statusCode.toString());
        print('eroooorerer');
      }
    } catch (e) {
      print(e.toString());
    }
    return listOfConsultantRating;
  }
}
