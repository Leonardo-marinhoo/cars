import 'dart:async';

import 'package:cars/models/user.dart';
import 'package:cars/services/api_response.dart';
import 'package:cars/services/login_api.dart';

class LoginBloc{
  final _streamController = StreamController<bool>();
  Stream<bool> get stream => _streamController.stream;
    Future<ApiResponse<User>> login(String login, String password) async {

      _streamController.add(true);
      ApiResponse<User> response = await(LoginApi.login(login, password));

      _streamController.add(false);
      return response;
    }
    void dispose(){
      _streamController.close();
    }
}