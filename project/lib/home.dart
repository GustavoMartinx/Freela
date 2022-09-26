import 'package:flutter/material.dart';
import 'package:project/widgets/navbar.dart';
import 'package:project/widgets/form.dart';
import 'package:project/widgets/web_scrollbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<_MyHomePageState>();
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFF0C0526),
        // appBar: PreferredSize(
        //   preferredSize: Size(screenSize.width, 1000),
        //   child: Navbar(),
        // ),
        body: WebScrollbar(
          color: Color(0xFF676C71),
          backgroundColor: Color(0xFF676C71),
          width: 10,
          heightFraction: 0.3,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                // Container(
                //   // image below the top bar
                //   child: SizedBox(
                //     height: screenSize.height,
                //     // height: screenSize.height * 0.6,
                //     width: screenSize.width,
                //     child: Image.asset(
                //       'images/wp1.jpg',
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Container(
                  child: SizedBox(
                    height: 110,
                    // height: screenSize.height * 0.6,
                    width: 275,
                    child: ButtonTheme(
                      //minWidth: 70.0,
                      //height: 60.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(50, 20),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Stack(
                                    // overflow: Overflow.visible,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Nome completo:'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText: 'E-mail:'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText: 'Senha:'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Confirmar senha:'),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                child: Text("Registrar"),
                                                onPressed: () {
                                                  // if (_formKey.currentState.validate()) {
                                                  //   _formKey.currentState.save();
                                                  // }
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 110,
                    // height: screenSize.height * 0.6,
                    width: 275,
                    child: ButtonTheme(
                      //minWidth: 70.0,
                      //height: 60.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(50, 20),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Stack(
                                    // overflow: Overflow.visible,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Nome completo:'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText: 'E-mail:'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText: 'Senha:'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Confirmar senha:'),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                child: Text("Registrar"),
                                                onPressed: () {
                                                  // if (_formKey.currentState.validate()) {
                                                  //   _formKey.currentState.save();
                                                  // }
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text("Sign up"),
                      ),
                    ),
                  ),
                ),
                // MyCustomForm(),
              ],
            ),
          ),
        ));
  }
}
