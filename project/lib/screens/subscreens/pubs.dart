import 'package:flutter/material.dart';
import '../profile.dart';

class MyPubs extends StatefulWidget {
  const MyPubs({super.key});

  @override
  State<MyPubs> createState() => _MyPubsState();
}

class _MyPubsState extends State<MyPubs> {
  final ScrollController _controllerOne = ScrollController();

  Future<void> dialogBuilderPub(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                  height: 700,
                  width: 500,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        height: 450,
                        width: 500,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('/images/post1.jpg'))),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.only(top: 20),
                        child: const Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical, //.horizontal
                            child: Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classicaContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, \nmaking it over 2000 years old. Richard McClintock, a LatContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Contrary to popular belief, \nLorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Lat Lat Lat Lat 2000 years old. Richard McClintock, a Lat",
                                textAlign: TextAlign.justify),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 200,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controllerOne,
      thumbVisibility: true,
      child: GridView.builder(
        controller: _controllerOne,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisExtent: 700),
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
                      height: 600,
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
                                      MaterialPageRoute(
                                          builder: (context) => MyProfile()),
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
                                          builder: (context) => MyProfile()),
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
                          Container(
                            width: 500,
                            padding: const EdgeInsets.all(10.0),
                            child: const Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classica",
                                textAlign: TextAlign.justify),
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
                            padding: const EdgeInsets.all(10.0),
                            child: const ListTile(
                              title: Text("Vagas abertas na InterSoft!"),
                              subtitle:
                                  Text("Inscrições até o dia 12 de dezembro!"),
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
