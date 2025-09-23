import 'dart:async';

import 'package:cars/models/service.dart';
import 'package:cars/services/service_api.dart';

class ServiceBloc {
  final _streamController = StreamController<List<Service>>();

  Stream<List<Service>> get stream => _streamController.stream;

  getServices() async {
    try {
  List<Service> services = await ServiceApi().getServices();
  _streamController.add(services);
} on Exception catch (e) {
  _streamController.addError(e);
}
  }

  void dispose() {
    _streamController.close();
  }
}
