import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String password) async {

    Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    Map params = {'login': login, 'password': password};
    String json = jsonEncode(params);


    var url = Uri.https(
      'guiataubate.free.beeceptor.com', '/rest/login',
    );

    var response = await http.post(url, body: json, headers: headers);
    print("response: ${response.body}");
    return true;
  }
}
