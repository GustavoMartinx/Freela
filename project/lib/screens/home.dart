import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).secondaryHeaderColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'Contratar'),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        _buildButtonColumn(color, Icons.near_me, 'Oferecer'),
      ],
    );

    // Color.fromARGB(255, 255, 255, 255).withOpacity(0.5)

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

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
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
              onPressed: () {},
              child: Text(
                label,
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
  }
}
