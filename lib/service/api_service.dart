import 'dart:convert';

import 'package:cozy_app/model/space/space.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //create function get data
  static Future<List<Space>> getData() async {
    Uri url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      // List<Space> space = data.map((json) => Space.fromJson(json)).toList();
      List<Space> result = data.map((item) => Space.fromJson(item)).toList();
      return result;
    } else {
      return <Space>[];
    }
  }
}
