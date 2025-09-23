import 'dart:async';

import 'package:cars/models/service.dart';
import 'package:cars/services/service_api.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> with AutomaticKeepAliveClientMixin <ServiceList> {
  @override
  bool get wantKeepAlive => true;

  final _streamController = StreamController<List<Service>>();

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  @override
  void dispose(){
    super.dispose();
    _streamController.close();
  }

  _fetchServices() async {
    List<Service> services = await ServiceApi().getServices();
    _streamController.add(services);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<List<Service>>(
      stream: _streamController.stream,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<Service> services = asyncSnapshot.data!;
        return ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            Service curService = services[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              color: Colors.grey,
              child: SizedBox(height: 500, width: double.infinity),
            );
          },
        );
      },
    );
  }
}
