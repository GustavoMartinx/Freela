import 'package:flutter/material.dart';
import './subscreens/sidemenu.dart';
import './subscreens/pubs.dart';

class MyFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Menu'),
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
        child: MyPubs(),
      ),
    );
  }
}
