import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:live_coaching/models/url_user.dart';
import 'package:http/http.dart' as http;

class Authsections {
  Dio dio = Dio();

  section() async {
    var response = await http.get(Uri.parse(Applivecoaching().sections));
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      return res;
    } else {
      throw Exception("‘Failed to load users’");
    }
  }

  getdatacatig(String id) async {
    var response =
        await http.get(Uri.parse(Applivecoaching().getdatacatig + '/$id'));
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      return res;
    } else {
      throw Exception("‘Failed to load users’");
    }
  }
}
