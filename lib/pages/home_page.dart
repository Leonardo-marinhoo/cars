import 'dart:async';

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:cars/models/service.dart';
import 'package:cars/models/user.dart';
import 'package:cars/services/service_api.dart';
import 'package:cars/widgets/containers/service_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  final _userStreamController = StreamController<User>();

  final List<TabItem> navigationTabs = [
    TabItem(icon: FontAwesomeIcons.house, title: 'Barbearia'),
    TabItem(icon: FontAwesomeIcons.scissors, title: 'Serviços'),
    TabItem(icon: FontAwesomeIcons.calendar, title: 'Agenda'),
    TabItem(icon: FontAwesomeIcons.wallet, title: 'Financeiro'),
    TabItem(icon: FontAwesomeIcons.users, title: 'Clientes'),
  ];
  int curSelectedTab = 0;

  @override
  void initState() {
    super.initState();
    // _loadUser();

    _loadUser();
  }

  @override
  void dispose() {
    super.dispose();
    _userStreamController.close();
  }

 
  _loadUser() async {
    User? user = await User.get();

    if (user != null) {
      _userStreamController.add(user);
      //FAZER VERIFICAÇÃO SE TOKEN É VALIDO OU RETORNAR NULL / ERRO / VOLTAR PRA TELA DE LOGIN
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _userStreamController.stream,
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
          bottomNavigationBar: BottomBarCreative(
            indexSelected: curSelectedTab,
            items: navigationTabs,
            onTap: (index) => setState(() {
              curSelectedTab = index;
            }),
            backgroundColor: Colors.white,
            color: const Color.fromARGB(255, 158, 158, 158),
            colorSelected: const Color.fromARGB(255, 0, 34, 255),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ServiceList(),
            ),
          ),
        );
      },
    );
  }
}
