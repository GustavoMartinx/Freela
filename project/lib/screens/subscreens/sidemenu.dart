import 'package:flutter/material.dart';
import 'package:project/screens/feed.dart';
import 'package:project/screens/subscreens/pubsUser.dart';
import '../profile.dart';
import '../home.dart';
import '../panel.dart';
import '../testeFetch.dart';
import '../testeSend.dart';
import '../feedNotifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: null,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/logo.png'))),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Perfil'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfile()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.feed),
            title: Text('Feed'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyFeed()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_outlined),
            title: Text('Minhas publicações'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPanel()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('token', 'null');
              await prefs.setInt('idUser', -1);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
