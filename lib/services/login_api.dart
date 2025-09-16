import 'dart:convert';

import 'package:cars/models/user.dart';
import 'package:cars/services/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String password) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map params = {'email': login, 'password': password};
    String json = jsonEncode(params);

    var url = Uri.https(
      'comercio.oryntechnologies.online',
      '/api/tenant/login',
    );

      var response = await http.post(url, body: json, headers: headers);
    try {
      Map<String, dynamic> mapResponse = jsonDecode(response.body);
      mapResponse["user"]["token"] = mapResponse["token"];

      final User user = User.fromJson(mapResponse["user"]);
      user.save();

      return Succes(user);
    } catch (e) {
      print("-----------------------------------------");
      print(response.body);
      return Failure("msg: 'erro'");
    }
  }
}
