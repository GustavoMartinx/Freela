import 'package:flutter/material.dart';
import 'feed.dart';
import '../models/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<Usuario> registerUsuario(
  String cpf,
  String email,
  String senha,
  String nome,
) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/register-usuario'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'cpf': cpf,
      'email': email,
      'senha': senha,
      'nome': nome,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Usuario.fromJson(
        jsonDecode(response.body)['dados']); // estranho (colocar popup?)
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Falha ao registrar o usuário.');
  }
}

Future<dynamic> loginUsuario(
  String email,
  String senha,
) async {
  final response =
      await http.post(Uri.parse('http://localhost:3000/login-usuario'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{'email': email, 'senha': senha}));

  if (response.statusCode == 201) {
    return jsonDecode(response.body)['user']; // estranho (colocar popup?)
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Falha ao logar o usuário.');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerCpf = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  Future<Usuario>? _futureRegisterUsuario;
  Future<dynamic>? _futureLoginUsuario;

  late String nome;
  late String cpf;
  late String email;
  late String senha;
  // late String senhaVerif;

  Widget buildNome() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Nome'),
      validator: (value) {
        if (value == '') {
          return 'Digite seu nome';
        }
      },
      onSaved: (value) {
        nome = value.toString();
      },
      controller: _controllerNome,
    );
  }

  Widget buildCpf() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'CPF'),
      validator: (value) {
        if (value == '') {
          return 'Digite seu CPF';
        }
        return '';
      },
      onSaved: (value) {
        cpf = value.toString();
      },
      controller: _controllerCpf,
    );
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == '') {
          return 'Digite seu e-mail';
        }
        return '';
      },
      onSaved: (value) {
        email = value.toString();
      },
      controller: _controllerEmail,
    );
  }

  Widget buildSenha() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Senha'),
      obscureText: true,
      validator: (value) {
        if (value == '') {
          return 'Digite sua senha';
        }
        return '';
      },
      onSaved: (value) {
        senha = value.toString();
      },
      controller: _controllerSenha,
    );
  }

  // Widget buildSenhaVerif() {
  //   return TextFormField(
  //     decoration: const InputDecoration(labelText: 'Confirmar senha'),
  //     validator: (value) {
  //       if (value == '') {
  //         return 'Digite sua senha novamente';
  //       }
  //     },
  //     onSaved: (value) {
  //       senhaVerif = value.toString();
  //     },
  //   );
  // }

  Future<void> dialogBuilderRegister(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Registrar'),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildNome(),
                  buildCpf(),
                  buildEmail(),
                  buildSenha(),
                  // buildSenhaVerif(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Registrar',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    onPressed: () => {
                      setState(() {
                        _futureRegisterUsuario = registerUsuario(
                            _controllerCpf.text,
                            _controllerEmail.text,
                            _controllerSenha.text,
                            _controllerNome.text);
                      }),
                      Navigator.pop(context),
                      dialogBuilderLogin(context),
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }

  Future<void> dialogBuilderLogin(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Login'),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildEmail(),
                  buildSenha(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text(
                        'Logar',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onPressed: () => {
                        setState(() {
                          _futureLoginUsuario = loginUsuario(
                              _controllerEmail.text, _controllerSenha.text);
                        }),
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyFeed()),
                        )
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.red.withOpacity(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          )),
                          side: BorderSide(color: Colors.white)),
                      child: const Text(
                        'Não possui conta? Registrar',
                        style:
                            TextStyle(color: Color(0xFF0D3071), fontSize: 14),
                      ),
                      onPressed: () => {dialogBuilderRegister(context)},
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).secondaryHeaderColor;

    final GlobalKey<_MyHomePage> _formKey = GlobalKey<_MyHomePage>();

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1),
          child: SizedBox(
            width: 400,
            height: 155,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {
                dialogBuilderLogin(context);
              },
              child: Text(
                'Contratar',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        Container(
          margin: const EdgeInsets.only(top: 1),
          child: SizedBox(
            width: 400,
            height: 155,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {
                dialogBuilderLogin(context);
              },
              child: Text(
                'Oferecer',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget logoSloganButtonSection = Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(vertical: 205),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/logo.png')),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text(
              "Precisa de dinheiro? Faz um Freela!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 40)),
            buttonSection,
          ],
        ));

    Widget bigImageSection = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AssetImage('images/ilustracao.png')),
      ],
    );

    Widget _buildThinSite() {
      return Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: logoSloganButtonSection,
        ),
      );
    }

    Widget _buildCompleteSite() {
      return Center(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: FittedBox(
                fit: BoxFit.contain,
                child: logoSloganButtonSection,
              )),
              Expanded(child: bigImageSection),
            ]),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D3071),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1314) {
            return _buildCompleteSite();
          } else {
            return _buildThinSite();
          }
        },
      ),
    );
  }
}
