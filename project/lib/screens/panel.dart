import 'package:flutter/material.dart';
import './subscreens/sidemenu.dart';
import './subscreens/pubsUser.dart';

class MyPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: InkWell(
          splashColor: Colors.white.withAlpha(700),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PubsUser()),
            );
          },
          child: const Text('Menu'),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: IconButton(
              tooltip: "Notificações",
              icon: const Icon(
                Icons.notifications,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const Center(
        child: PubsUser(),
      ),
    );
  }
}
