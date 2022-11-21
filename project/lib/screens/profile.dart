import 'package:flutter/material.dart';
import './subscreens/sidemenu.dart';
import 'feed.dart';
import 'notifications.dart';

class Profile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("/images/wp2.jpg"),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blueAccent.shade100],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // stack
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 90.0,
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundImage: NetworkImage('assets/images/p1.jpeg'),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 125),
                            child: Container(
                              height: 50,
                              alignment: Alignment.bottomRight,
                              child: FloatingActionButton(
                                child: Icon(Icons.camera_alt_rounded),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Fulana',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Engenheira de Software',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      'fulanaciclana@gmail.com',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Center(
                    child: Text(
                      'GitHub',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      'https://github.com/Fulana',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Center(
                    child: Text(
                      'Linkedin',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      'www.linkedin.com/in/Fulana',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: const BackButton(
          color: Colors.white, // <-- SEE HERE
        ),
      ),
      // appBar: AppBar(
      //   title: InkWell(
      //     splashColor: Colors.white.withAlpha(700),
      //     onTap: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => MyFeed()),
      //       );
      //     },
      //     child: const Text('Menu'),
      //   ),
      //   actions: [
      //     Container(
      //       margin: const EdgeInsets.only(right: 15),
      //       child: IconButton(
      //         tooltip: "Notificações",
      //         icon: const Icon(
      //           Icons.notifications,
      //         ),
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Notificacao()),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      body: Center(
        child: Profile(),
      ),
    );
  }
}
