import 'package:flutter/material.dart';

import './profile2.dart';

class Notificacao extends StatefulWidget {
  const Notificacao({super.key});

  @override
  State<Notificacao> createState() => _NotificacaoState();
}

class _NotificacaoState extends State<Notificacao> {
  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controllerOne,
      thumbVisibility: true,
      child: GridView.builder(
        controller: _controllerOne,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 400, crossAxisSpacing: 30),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(115, 177, 160, 160),
                  ),
                ),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(700),
                  onTap: () {
                    dialogBuilderPub(context);
                  },
                  child: Container(
                      height: 350,
                      width: 400,
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
                                            image:
                                                AssetImage('/images/p1.jpeg'))),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                margin: EdgeInsets.only(top: 40.0),
              )
            ],
          );
        },
      ),
    );
  }
}
