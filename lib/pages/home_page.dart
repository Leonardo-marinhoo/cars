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
  late List<Service> services;

  @override
  void initState() {
    super.initState();
    // _loadUser();

    _futureUser = User.get();

  }

  _fetchServices() async {
    List<Service> _futureServices = await ServiceApi().getServices();
    setState(() {
      services = _futureServices;
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
            child: _servicesList(services),
          ),
        );
      },
    );
  }



  Widget _servicesList(List<Service> services) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        Service curService = services[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          color: Colors.grey,
          child: SizedBox(
            height: 500,
            width: double.infinity
          ),
        );
      },
    );
  }
}
