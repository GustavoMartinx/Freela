import 'package:flutter/material.dart';
import '../../models/pubForm.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<List<dynamic>> fetchPubs() async {
  final response = await http.get(Uri.parse('http://localhost:3000/index-pub')
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
    //print(jsonDecode(response.body)['pub']);
    // MedicalRecordsModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>
    return jsonDecode(response.body)['pub'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Usuario');
  }
}

class MyListPub extends StatefulWidget {
  @override
  createState() => _MyListPubState();
}

class _MyListPubState extends State {
  late Future<Pub> futureUsuario;
  var pubs = <Pub>[];

  _getPubs() async {
    List<dynamic> list = await fetchPubs();
    print(list);
    setState(() {
      pubs = list.map((model) => Pub.fromJson(model)).toList();
      print(pubs);
    });
  }

  @override
  void initState() {
    super.initState();
    _getPubs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pub List"),
        ),
        body: ListView.builder(
          itemCount: pubs.length,
          itemBuilder: (context, index) {
            return const Text("pubs[index].titulo");
          },
        ));
  }
}
