import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/usuario.dart';

Future<Usuario> fetchUsuario() async {
  final response = await http.get(
      Uri.parse('http://localhost:3000/show-usuario/1')
      //res.header("Access-Control-Allow-Methods", 'GET, PUT, POST, DELETE');

      // Indica qual tipo de conteúdo autorizar.

      // res.header("Access-Control-Allow-Headers", 'X-PINGOTHER, Content-Type, Authorization');
      // headers: {
      //   HttpHeaders.accessControlAllowOriginHeader: '*',
      //   HttpHeaders.accessControlAllowMethodsHeader: 'GET, PUT, POST, DELETE',
      //   HttpHeaders.accessControlAllowHeadersHeader:
      //       'X-PINGOTHER, Content-Type, Authorization',
      //   HttpHeaders.contentTypeHeader: 'application/json',
      //   HttpHeaders.acceptHeader: 'application/json'
      // },
      );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Usuario.fromJson(jsonDecode(response.body)['user']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Usuario');
  }
}

class TesteFetch extends StatefulWidget {
  const TesteFetch({super.key});

  @override
  State<TesteFetch> createState() => _TesteState();
}

class _TesteState extends State<TesteFetch> {
  late Future<Usuario> futureUsuario;

  @override
  void initState() {
    super.initState();
    futureUsuario = fetchUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Usuario>(
            future: futureUsuario,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.cpf),
                    Text(snapshot.data!.nome),
                    Text(snapshot.data!.profissao),
                    Text(snapshot.data!.imagem),
                    Text(snapshot.data!.descricao)
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
