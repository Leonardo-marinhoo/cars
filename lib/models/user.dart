import 'dart:convert';

import 'package:cars/utils/prefs.dart';

class User {
  String name;
  String email;
  String phone;
  String cpf_cnpj;
  String image_url;
  String role;
  String token;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf_cnpj,
    required this.image_url,
    required this.role,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      cpf_cnpj: json["cpf_cnpj"],
      image_url: json["image_url"],
      role: json["role"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["cpf_cnpj"] = cpf_cnpj;
    data["image_url"] = image_url;
    data["role"] = role;
    data["token"] = token;

    return data;
  }

  void save() {
    Map map = toJson();
    String json = jsonEncode(map);
    Prefs.setString('user.prefs', json);
  }

  static Future<User?> get() async {
    String? json = await Prefs.getString('user.prefs');

    if (json.isEmpty) {
      return null;
    }

    try {
      Map<String, dynamic> map = jsonDecode(json);
      return User.fromJson(map);
    } catch (e) {
      return null;
    }
  }
}
