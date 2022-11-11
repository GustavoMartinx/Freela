import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../profile2.dart';

Future<Details> fetchDetails() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  // (response.statusCode >= 200) && (response.statusCode <= 299)
  if (response.statusCode == 200) {
    return Details.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Details');
  }
}

class Details {
  // final String date;
  // final String time;
  // final String district;
  // final int value;
  // final String requirements;
  final int userId;
  final int id;
  final String title;

  const Details({
    // required this.date,
    // required this.time,
    // required this.district,
    // required this.value,
    // required this.requirements,
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      // date: json['date'], // confirmar nome/tipo correto do
      // time: json['time'], // atributo chave que estará no json
      // district: json['district'],
      // value: json['value'],
      // requirements: json['requirements'],
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class MyPubs extends StatefulWidget {
  const MyPubs({super.key});

  @override
  State<MyPubs> createState() => _MyPubsState();
}

class _MyPubsState extends State<MyPubs> {
  final ScrollController _controllerOne = ScrollController();
  late Future<Details> futureDetails;

  /*@override
  void initState() {
    super.initState();
    //futureDetails = fetchDetails();
  }*/

  // @override
  // Future<Details> builderDetails(BuildContext context) {
  //   return showDetails<Details>(
  //       context: context,
  //       future: futureDetails,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Column(
  //             children: [
  //               Text(snapshot.data!.date),
  //               Text(snapshot.data!.time),
  //               Text(snapshot.data!.district),
  //               Text(snapshot.data!.value.toString()),
  //               Text(snapshot.data!.requirements)
  //             ],
  //           );
  //         } else if (snapshot.hasError) {
  //           return Text('${snapshot.error}');

  //           // By default, show a loading spinner.
  //           return const CircularProgressIndicator();
  //         }
  //       });
  // }

  Future<void> dialogBuilderPub(BuildContext context) async {
    Details detalhes = await fetchDetails(); // foda
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 13.0),
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            padding: EdgeInsets.only(top: 20.0),
                            child: Expanded(
                              flex: 1,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical, //.horizontal
                                  child: Column(
                                    children: [
                                      Text(detalhes.title),
                                      Text(detalhes.id.toString()),
                                      Text(detalhes.userId.toString()),
                                      //Text(detalhes.value.toString()),
                                      //Text(detalhes.requirements)
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

// versao quebrada (future builder dentro do popup)
//  Future<void> dialogBuilderPub(BuildContext context) {
//    return showDialog<void>(
//      context: context,
//      builder: (BuildContext context) {
//        return AlertDialog(
//            titlePadding: const EdgeInsets.all(0),
//            title: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.topRight,
//                  child: IconButton(
//                    icon: Icon(
//                      Icons.close,
//                      color: Colors.black,
//                      size: 25,
//                    ),
//                    onPressed: () {
//                      Navigator.pop(context);
//                    },
//                  ),
//                ),
//              ],
//            ),
//            content: Column(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                Card(
//                  child: Container(
//                      padding: const EdgeInsets.symmetric(
//                          vertical: 10.0, horizontal: 13.0),
//                      child: Column(
//                        children: [
//                          Container(
//                            height: 250,
//                            padding: EdgeInsets.only(top: 20.0),
//                            child: const Expanded(
//                              flex: 1,
//                              child: SingleChildScrollView(
//                                scrollDirection: Axis.vertical, //.horizontal
//                                child: FutureBuilder<Details>(
//                                  future: futureDetails,
//                                  builder: (context, snapshot) {
//                                    if (snapshot.hasData) {
//                                      return Column(
//                                        children: [
//                                          Text(snapshot.data!.date),
//                                          Text(snapshot.data!.time),
//                                          Text(snapshot.data!.district),
//                                          Text(snapshot.data!.value.toString()),
//                                          Text(snapshot.data!.requirements)
//                                        ],
//                                      );
//                                    } else if (snapshot.hasError) {
//                                      return Text('${snapshot.error}');
//                                    }
//
//                                    // By default, show a loading spinner.
//                                    return const CircularProgressIndicator();
//                                  },
//                                ),
//                              ),
//                            ),
//                          ),
//                          Container(
//                            padding: EdgeInsets.only(top: 20),
//                            child: SizedBox(
//                              width: 200,
//                              height: 30,
//                              child: ElevatedButton(
//                                onPressed: () {
//                                  dialogBuilderNotify(context);
//                                },
//                                child: const Text(
//                                  'Tenho interesse',
//                                  style: TextStyle(
//                                    fontSize: 16,
//                                    fontWeight: FontWeight.w200,
//                                    color: Colors.white,
//                                  ),
//                                  textAlign: TextAlign.center,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      )),
//                )
//              ],
//            ));
//      },
//    );
//  }

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
          return SingleChildScrollView(
            // wrap with singlechildscrollview
            child: Column(
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
                                subtitle: Text(
                                    "Inscrições até o dia 12 de dezembro!"),
                              ),
                            ),
                          ],
                        )),
                  ),
                  margin: EdgeInsets.only(top: 40.0),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
