import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Perfil> fetchPerfil() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Perfil.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Perfil');
  }
}

class Perfil {
  final int userId;
  final int id;
  final String title;

  const Perfil({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Perfil.fromJson(Map<String, dynamic> json) {
    return Perfil(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  late Future<Perfil> futurePerfil;

  @override
  void initState() {
    super.initState();
    futurePerfil = fetchPerfil();
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
          child: FutureBuilder<Perfil>(
            future: futurePerfil,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.userId.toString()),
                    Text(snapshot.data!.id.toString()),
                    Text(snapshot.data!.title)
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
