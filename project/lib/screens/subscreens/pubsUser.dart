import 'dart:convert';

import 'package:flutter/material.dart';
import '../profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../profile2.dart';

int? idRecebido;
String? nomeRecebido;

class PubsUser extends StatefulWidget {
  const PubsUser({super.key});

  @override
  State<PubsUser> createState() => _PubsUserState();
}

class _PubsUserState extends State<PubsUser> {
  List pubs = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchPub();
  }

  fetchPub() async {
    setState(() {
      isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();

    idRecebido = await prefs.getInt("idUser");

    var response =
        await http.get(Uri.parse("http://localhost:3000/index-pub-based/1"));

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
                        ],
                      )),
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
              ],
            )),
      ),
      margin: EdgeInsets.only(top: 40.0),
    );
  }
}
