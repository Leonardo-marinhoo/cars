import 'package:cars/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<User?> _loadUser() async {
    User? user = await User.get();

    if (user !=null) {
      return user;
      //FAZER VERIFICAÇÃO SE TOKEN É VALIDO OU RETORNAR NULL / ERRO / VOLTAR PRA TELA DE LOGIN
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadUser(),
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final user = asyncSnapshot.data!;
        return Scaffold(
          appBar: AppBar(
            title: Text("Guia Taubaté", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.blue,
          ),
          body: Text(user.email),
        );
      },
    );
  }
}
