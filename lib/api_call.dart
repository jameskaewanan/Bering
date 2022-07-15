import 'dart:developer';
import 'package:http/http.dart' as http;
import 'model.dart';

class ApiConstants {
  static String baseUrl = 'https://datausa.io';
  static String usersEndpoint = '/api/data?Geography=05000US02&measure=Property%20Value&year=latest&drilldowns=County';
}

class ApiService {
  Future<County?> getCounty() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        County _model = countyFromJson(response.body);
        print("Cool beans");
        return _model;
      }
    } catch (e) {
      log(e.toString());
      print("something's fucky");
    }
  }
}
