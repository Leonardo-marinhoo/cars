import 'dart:ui';
import 'package:cars/blocs/login_bloc.dart';
import 'package:cars/models/user.dart';
import 'package:cars/pages/home_page.dart';
import 'package:cars/services/api_response.dart';
// import 'package:cars/services/login_api.dart';
import 'package:cars/utils/navigation.dart';
import 'package:cars/widgets/components/form_button.dart';
import 'package:cars/widgets/components/form_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _focusPassword = FocusNode();

  final _bloc = LoginBloc();

  // bool _showProgress = false; // substituído pelo stream do bloc

  @override
  void dispose() {
    _tLogin.dispose();
    _tPassword.dispose();
    _bloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: appBarWidget('Login Page'),
      body: _background(
        children: [
          _loginPanel(
            context,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(child: Image.asset('assets/images/spotway.png')),
                  SizedBox(height: 20),

                  FormInput(
                    label: "Login",
                    hint: "Digite o E-mail",
                    controller: _tLogin,
                    validator: _validateLogin,
                    inputType: TextInputType.emailAddress,
                    nextFocus: _focusPassword,
                  ),
                  SizedBox(height: 8),
                  FormInput(
                    label: "Senha",
                    hint: "Digite a senha",
                    obscure: true,
                    controller: _tPassword,
                    validator: _validatePassword,
                    inputType: TextInputType.number,
                    focusNode: _focusPassword,
                  ),
                  SizedBox(height: 8),
                  StreamBuilder<bool>(
                    stream: _bloc.stream,
                    initialData: false,
                    builder: (context, snapshot) {
                      final isLoading = snapshot.data == true;
                      return FormButton(
                        text: "Login",
                        onPressed: isLoading ? null : _onClickLogin,
                        showProgress: isLoading,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Digite a senha";
    }

    return null;
  }

  String? _validateLogin(String? text) {
    if (text == null || text.isEmpty) {
      return "Digite o Login";
    }

    return null;
  }

  Center _loginPanel(BuildContext context, {Widget? child}) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: child,
      ),
    );
  }

  Widget _background({required List<Widget> children}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          "https://w0.peakpx.com/wallpaper/980/789/HD-wallpaper-cars-sports-cars-off-road-sports-for-your-mobile-tablet-explore-road-vertical-vertical-background-vertical-vertical.jpg",
          fit: BoxFit.cover,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 48),
          child: Container(color: Color.fromRGBO(1, 1, 1, 0.141)),
        ),
        ...children,
      ],
    );
  }

  void _onClickLogin() async {
    if (!_formKey.currentState!.validate()) return;

    String login = _tLogin.text;
    String password = _tPassword.text;

    print("login: $login");
    print("password: $password");

    ApiResponse<User> response = await _bloc.login(login, password);

    if (response.succes) {
      User user = response.result!;
      navigateTo(context, HomePage());
      print(user.cpf_cnpj);
      print(user);
    } else {
      return alert("Usuário e/ou senha inválido(s)");
    }
  }

  void alert(String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          child: AlertDialog(
            title: Text("Guia"),
            content: Text(msg),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Fechar"),
              ),
            ],
          ),
        );
      },
    );
  }
}
