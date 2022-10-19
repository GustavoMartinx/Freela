import 'package:flutter/material.dart';
import 'feed.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).secondaryHeaderColor;
    String email;
    String senha;

    final GlobalKey<_MyHomePage> _formKey = GlobalKey<_MyHomePage>();

    Widget buildNome() {
      return TextFormField(
        decoration: const InputDecoration(labelText: 'Nome'),
        validator: (value) {
          if (value == '') {
            return 'Digite seu nome';
          }
        },
        onSaved: (value) {
          email = value.toString();
        },
      );
    }

    Widget buildEmail() {
      return TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value == '') {
            return 'Digite seu e-mail';
          }
        },
        onSaved: (value) {
          email = value.toString();
        },
      );
    }

    Widget buildSenha() {
      return TextFormField(
        decoration: const InputDecoration(labelText: 'Senha'),
        validator: (value) {
          if (value == '') {
            return 'Digite sua senha';
          }
        },
        onSaved: (value) {
          senha = value.toString();
        },
      );
    }

    Widget buildSenhaVerif() {
      return TextFormField(
        decoration: const InputDecoration(labelText: 'Confirmar senha'),
        validator: (value) {
          if (value == '') {
            return 'Digite sua senha novamente';
          }
        },
        onSaved: (value) {
          email = value.toString();
        },
      );
    }

    Future<void> dialogBuilderLogin(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Login'),
              content: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildEmail(),
                    buildSenha(),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      child: const Text(
                        'Logar',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyFeed()),
                        )
                      },
                    )
                  ],
                ),
              ));
        },
      );
    }

    Future<void> dialogBuilderRegister(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Registrar'),
              content: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildNome(),
                    buildEmail(),
                    buildSenha(),
                    buildSenhaVerif(),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      child: const Text(
                        'Registrar',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyFeed()),
                        )
                      },
                    )
                  ],
                ),
              ));
        },
      );
    }

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1),
          child: SizedBox(
            width: 400,
            height: 155,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {
                dialogBuilderLogin(context);
              },
              child: Text(
                'Contratar',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        Container(
          margin: const EdgeInsets.only(top: 1),
          child: SizedBox(
            width: 400,
            height: 155,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {
                dialogBuilderLogin(context);
              },
              child: Text(
                'Oferecer',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    Widget logoSloganButtonSection = Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(vertical: 205),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/logo.png')),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text(
              "Precisa de dinheiro? Faz um Freela!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 40)),
            buttonSection,
          ],
        ));

    Widget bigImageSection = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AssetImage('images/ilustracao.png')),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0D3071),
      body: Row(
        children: [
          logoSloganButtonSection,
          Expanded(child: bigImageSection),
        ],
      ),
    );
  }
}
