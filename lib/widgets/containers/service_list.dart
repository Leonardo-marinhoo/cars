import 'dart:async';

import 'package:cars/blocs/service_bloc.dart';
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

  final _serviceBloc = ServiceBloc();

  @override
  void initState() {
    super.initState();
    _serviceBloc.getServices();
  }

  @override
  void dispose(){
    super.dispose();
    _serviceBloc.dispose();
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<List<Service>>(
      stream: _serviceBloc.stream,
      builder: (context, asyncSnapshot) {
        if(asyncSnapshot.hasError){
          return Center(child:Text("Erro ao carregar serviços"));
        }
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
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
