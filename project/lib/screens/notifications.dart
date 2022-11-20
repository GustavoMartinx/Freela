import 'package:flutter/material.dart';

import './profile2.dart';

class Notificacao extends StatefulWidget {
  const Notificacao({super.key});

  @override
  State<Notificacao> createState() => _NotificacaoState();
}

class _NotificacaoState extends State<Notificacao> {
  final ScrollController _controllerOne = ScrollController();

  Widget buttonShowRefuse = Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ))),
        onPressed: () {
          // dialogBuilderLogin(context);
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
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ))),
        onPressed: () {
          // dialogBuilderLogin(context);
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
  );

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
                        width: 400,
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
                                children: [
                                  Text("Enviou uma mensagem para você!",
                                      textAlign: TextAlign.center),
                                  Padding(padding: EdgeInsets.only(left: 40)),
                                  buttonShowRefuse,
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
