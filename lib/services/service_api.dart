import 'dart:convert';

import 'package:cars/models/service.dart';
import 'package:cars/services/AuthClient.dart';

class ServiceApi{

  final client = Authclient();

  Future<List<Service>> getServices() async{
    Uri url = Uri.https('comercio.oryntechnologies.online', '/api/services');
    var response = await client.get(url);

   List list = jsonDecode(response.body);


  List<Service> services = [];
  for(Map<String, dynamic> map in  list){
    services.add(Service.fromJson(map));
  }
  return services;

  }
}