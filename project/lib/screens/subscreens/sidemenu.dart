import 'package:flutter/material.dart';
import 'package:project/screens/feed.dart';
import 'package:project/screens/subscreens/pubsUser.dart';
import '../profile.dart';
import '../home.dart';
import '../panel.dart';
import '../testeFetch.dart';
import '../testeSend.dart';

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
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Fale conosco'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Teste Fetch'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TesteFetch()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Teste Send'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TesteSend()),
              )
            },
          ),
        ],
      ),
    );
  }
}
