import 'package:flutter/material.dart';

class MyPubs extends StatefulWidget {
  const MyPubs({super.key});

  @override
  State<MyPubs> createState() => _MyPubsState();
}

class _MyPubsState extends State<MyPubs> {
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
            crossAxisCount: 1, mainAxisExtent: 250),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('A card that can be tapped'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
