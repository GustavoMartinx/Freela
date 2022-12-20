import 'dart:html';

import 'package:flutter/material.dart';
import '../../models/pubForm.dart';
import 'package:http/http.dart' as http;
import '../../models/notificacao.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../profile2.dart';

// Future<Pub> fetchPubRelated() async {
//   final response =
//       await http.get(Uri.parse('http://localhost:3000/show-pub/1'));

//   // (response.statusCode >= 200) && (response.statusCode <= 299)
//   if (response.statusCode == 200) {
//     return Pub.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load Pub');
//   }
// }

Future<Notif> createNotification(
    String titulo, String fonteContato, String contato) async {
  final response = await http.post(
    Uri.parse(
        'http://localhost:3000/store-notificacao/'), //https://jsonplaceholder.typicode.com/albums  // http://localhost:3000/store-pub/
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'titulo': titulo,
      'fonteContato': fonteContato,
      'contato': contato,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Notif.fromJson(
        jsonDecode(response.body)['dados']); // estranho (colocar popup?)
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Notificacao.');
  }
}

class MyListPub extends StatefulWidget {
  @override
  createState() => _MyListPubState();
}

class _MyListPubState extends State {
  // late Future<Pub> futureUsuario;
  // var pubs = <Pub>[];
  List pubs = [];
  bool isLoading = false;
  Future<Notif>? _futureNotification;

  // _getPubs() async {
  //   List<dynamic> list = await fetchPubs();
  //   print(list);
  //   setState(() {
  //     pubs = list.map((model) => Pub.fromJson(model)).toList();
  //     print(pubs);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    this.fetchPub();
  }

  fetchPub() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://localhost:3000/index-pub";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var items = jsonDecode(response.body)['pub'];
      setState(() {
        pubs = items;
        isLoading = false;
      });
    } else {
      pubs = [];
      isLoading = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    if (pubs.contains(null) || pubs.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
      ));
    }
    return ListView.builder(
        itemCount: pubs.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [getCard(pubs[index])],
          );
        });
  }

  Future<void> dialogBuilderPub(
      BuildContext context,
      String nomeCriador,
      String titulo,
      String descricao,
      String vaga,
      String valor,
      String modeloTrab,
      String datasHorarios,
      String cidadeBairro) async {
    //Pub pubs = await fetchPubRelated(); // foda
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            titlePadding: const EdgeInsets.all(0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 350,
                            width: 400,
                            padding: EdgeInsets.only(top: 20.0),
                            child: Expanded(
                              flex: 1,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical, //.horizontal
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Profile2()),
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(3.0),
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    image: const DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            '/images/p1.jpeg'))),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Profile2()),
                                                );
                                              },
                                              child: Text(
                                                nomeCriador,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(titulo,
                                              textAlign: TextAlign.justify),
                                          leading: const Text("Título:",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      ListTile(
                                          title: Text(vaga,
                                              textAlign: TextAlign.justify),
                                          leading: const Text("Vaga:",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      ListTile(
                                          title: Text(descricao,
                                              textAlign: TextAlign.justify),
                                          leading: const Text("Descrição:",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      ListTile(
                                          title: Text(valor,
                                              textAlign: TextAlign.justify),
                                          leading: const Text("Valor:",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      ListTile(
                                          title: Text(modeloTrab,
                                              textAlign: TextAlign.justify),
                                          leading: const Text(
                                              "Modelo de trabalho:",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      ListTile(
                                          title: Text(datasHorarios,
                                              textAlign: TextAlign.justify),
                                          leading: const Text("Datas/Horários:",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      ListTile(
                                          title: Text(cidadeBairro,
                                              textAlign: TextAlign.justify),
                                          leading: const Text("Cidade/Bairro:",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ],
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: 200,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _futureNotification = createNotification(
                                      titulo,
                                      "Telefone",
                                      "(44)9 9991-5365",
                                    );
                                  });
                                  dialogBuilderNotify(context);
                                },
                                child: const Text(
                                  'Tenho interesse',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ));
      },
    );
  }

  Future<void> dialogBuilderNotify(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            titlePadding: const EdgeInsets.all(0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                      height: 50,
                      width: 500,
                      child: Text(
                          'Uma notificação foi enviada ao anunciante. O prazo máximo para retorno é de 24 horas.',
                          textAlign: TextAlign.justify)),
                )
              ],
            ));
      },
    );
  }

  Widget getCard(item) {
    String nomeUsuario = item['nomeUsuario'];
    String titulo = item['titulo'];
    //var imagem = item['imagem'];
    String descricao = item['descricao'];
    String vaga = item['vaga'];
    String valor = item['valor'];
    String modeloTrab = item['modeloTrab'];
    String datasHorarios = item['datasHorarios'];
    String cidadeBairro = item['cidadeBairro'];
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromARGB(115, 177, 160, 160),
        ),
      ),
      child: InkWell(
        splashColor: Colors.white.withAlpha(700),
        onTap: () {
          dialogBuilderPub(context, nomeUsuario, titulo, descricao, vaga, valor,
              modeloTrab, datasHorarios, cidadeBairro);
        },
        child: Container(
            height: 550,
            width: 500,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile2()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(3.0),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('/images/p1.jpeg'))),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile2()),
                          );
                        },
                        child: Text(
                          nomeUsuario,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      titulo,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  width: 500,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('/images/post1.jpg'))),
                ),
                Container(
                  width: 500,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(descricao, textAlign: TextAlign.justify),
                ),
              ],
            )),
      ),
      margin: EdgeInsets.only(top: 40.0),
    );
  }
}
