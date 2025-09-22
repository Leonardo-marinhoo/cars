import 'dart:async';

import 'package:cars/models/service.dart';
import 'package:cars/models/user.dart';
import 'package:cars/services/service_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<User?> _futureUser;

  final _streamController = StreamController<List<Service>>();

  @override
  void initState() {
    super.initState();
    // _loadUser();

    _futureUser = User.get();
    _fetchServices();
  }

  _fetchServices() async {
    List<Service> services = await ServiceApi().getServices();
    setState(() {
      _streamController.add(services);
    });
  }

  // Future<User?> _loadUser() async {
  //   User? user = await User.get();

  //   if (user !=null) {
  //     return user;
  //     //FAZER VERIFICAÇÃO SE TOKEN É VALIDO OU RETORNAR NULL / ERRO / VOLTAR PRA TELA DE LOGIN
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureUser,
      builder: (context, userSnapshot) {
        if (!userSnapshot.hasData || userSnapshot.hasError) {
          return Center(child: Text("erro"));
        }
        final user = userSnapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: Text(user.name, style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _servicesList(),
          ),
        );
      },
    );
  }

  Widget _servicesList() {
    return StreamBuilder<List<Service>>(
      stream: _streamController.stream,
      builder: (context, asyncSnapshot) {
        if(!asyncSnapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
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
