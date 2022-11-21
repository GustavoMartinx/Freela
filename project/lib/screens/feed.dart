import 'package:flutter/material.dart';
import './subscreens/sidemenu.dart';
import './subscreens/pubs.dart';
import 'notifications.dart';

class MyFeed extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => MyFeed()),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notificacao()),
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: MyListPub(),
      ),
    );
  }
}
