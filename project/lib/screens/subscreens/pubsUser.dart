import 'package:flutter/material.dart';
import '../profile.dart';

class PubsUser extends StatefulWidget {
  const PubsUser({super.key});

  @override
  State<PubsUser> createState() => _PubsUserState();
}

class _PubsUserState extends State<PubsUser> {
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
                  height: 450,
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('/images/post1.jpg'))),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 300,
                          height: 40,
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
            crossAxisCount: 3, mainAxisExtent: 700),
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
                      height: 450,
                      width: 300,
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            width: 300,
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
