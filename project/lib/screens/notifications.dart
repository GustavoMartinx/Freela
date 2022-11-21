import 'package:flutter/material.dart';

import './profile2.dart';

class Notificacao extends StatefulWidget {
  const Notificacao({super.key});

  @override
  State<Notificacao> createState() => _NotificacaoState();
}

class _NotificacaoState extends State<Notificacao> {
  final ScrollController _controllerOne = ScrollController();

  Future<void> dialogBuilderContatos(BuildContext context) {
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
                                  title: Text("Fulana@gmail.com",
                                      textAlign: TextAlign.justify),
                                  leading: const Text("Email:",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              ListTile(
                                  title: Text("(44) 9 8987-1234",
                                      textAlign: TextAlign.justify),
                                  leading: const Text("Telefone:",
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

  // Widget buttonShowRefuse = Column(
  //   mainAxisSize: MainAxisSize.min,
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     ElevatedButton(
  //       style: ButtonStyle(
  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //               RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(18.0),
  //       ))),
  //       onPressed: () {
  //         dialogBuilderContatos(context);
  //       },
  //       child: const Text(
  //         'Ver contato',
  //         style: TextStyle(
  //           fontSize: 15,
  //           fontWeight: FontWeight.w400,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //     const Padding(padding: EdgeInsets.only(top: 10)),
  //     ElevatedButton(
  //       style: ButtonStyle(
  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //               RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(18.0),
  //       ))),
  //       onPressed: () {
  //         // dialogBuilderLogin(context);
  //       },
  //       child: const Text(
  //         'Recusar',
  //         style: TextStyle(
  //           fontSize: 15,
  //           fontWeight: FontWeight.w400,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      body: Scrollbar(
        controller: _controllerOne,
        thumbVisibility: true,
        child: GridView.builder(
          controller: _controllerOne,
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisExtent: 200, crossAxisSpacing: 30),
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
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      "Têm interesse na vaga: Procura-se Desenvolvedor Full-Stack.",
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
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ))),
                                        onPressed: () {
                                          dialogBuilderContatos(context);
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
                                      const Padding(
                                          padding: EdgeInsets.only(top: 10)),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
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
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
