import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/notificacao.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../profile2.dart';

class MyListNotification extends StatefulWidget {
  @override
  createState() => _MyListNotificationState();
}

class _MyListNotificationState extends State {
  List notifications = [];
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
    var url = "http://localhost:3000/index-notificacao";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var items = jsonDecode(response.body)['notificacao'];
      setState(() {
        notifications = items;
        isLoading = false;
      });
    } else {
      notifications = [];
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
    if (notifications.contains(null) || notifications.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
      ));
    }
    return ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [getCard(notifications[index])],
          );
        });
  }

  Future<void> dialogBuilderContatos(
      BuildContext context, String contato, String fonteContato) {
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
                    height: 200,
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
                                              builder: (context) => Profile2()),
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
                                              builder: (context) => Profile2()),
                                        );
                                      },
                                      child: const Text(
                                        "Fulana da Silva Pereira",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ListTile(
                                  title: Text(contato,
                                      textAlign: TextAlign.justify),
                                  leading: Text(fonteContato + ':',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  Future<void> dialogBuilderRefuse(BuildContext context) {
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
                      child: Text('Deseja mesmo recusar?',
                          textAlign: TextAlign.center)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                      width: 200,
                      height: 30,
                      child: Row(children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          child: const Text(
                            'Sim',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 40)),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text(
                            'Não',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ])),
                ),
              ],
            ));
      },
    );
  }

  Widget getCard(item) {
    String titulo = item['titulo'];
    String fonteContato = item['fonteContato'];
    String contato = item['contato'];
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromARGB(115, 177, 160, 160),
        ),
      ),
      child: InkWell(
        splashColor: Colors.white.withAlpha(700),
        onTap: () {
          //dialogBuilderPub(context);
        },
        child: Container(
            height: 150,
            width: 600,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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
                        child: const Text(
                          "Fulana da Silva Pereira",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Tem interesse na vaga: " + titulo,
                          textAlign: TextAlign.center),
                      Padding(padding: EdgeInsets.only(left: 40)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            onPressed: () {
                              dialogBuilderContatos(
                                  context, contato, fonteContato);
                            },
                            child: const Text(
                              'Ver contato',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            onPressed: () {
                              dialogBuilderRefuse(context);
                            },
                            child: const Text(
                              'Recusar',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
      margin: EdgeInsets.only(top: 40.0),
    );
  }
}
