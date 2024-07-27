import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_wether/model/WetherData.dart';

class wetherService {
  fetchWether() async {
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=21.1702&lon=72.8311&appid=86b1f76a4515a219a8157e2a9e47ca57&units=metric&exclude=minutely',
        // 'https://api.openweathermap.org/data/2.5/weather?lat=21.6015&lon=71.2204&appid=86b1f76a4515a219a8157e2a9e47ca57&units=metric&exclude=minutely',
      ),
    );

    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WetherData.fromJson(json);
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
