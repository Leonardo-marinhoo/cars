
import 'package:cars/models/user.dart';
import 'package:http/http.dart' as http;
class Authclient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async{
    User? user = await User.get();

    if(user !=null && user.token.isNotEmpty){
      request.headers['Authorization'] = 'Bearer ${user.token}';
    }
      return _inner.send(request);
  }
}