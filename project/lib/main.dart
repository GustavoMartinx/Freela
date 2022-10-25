import 'package:flutter/material.dart';
import 'screens/home.dart';

// class ResponsiveLayout extends StatelessWidget {
//   final Widget largeScreen;
//   final Widget mediumScreen;
//   final Widget smallScreen;

//   const ResponsiveLayout(
//       {Key key,
//       @required this.largeScreen,
//       this.mediumScreen,
//       this.smallScreen})
//       : super(key: key);

//   static bool isSmallScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width < 800;
//   }

//   static bool isMediumScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width > 800 &&
//         MediaQuery.of(context).size.width < 1200;
//   }

//   static bool isLargeScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width > 800;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth > 800) {
//           return largeScreen;
//         } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
//           return mediumScreen ?? largeScreen;
//         } else {
//           return smallScreen ?? largeScreen;
//         }
//       },
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Freela App',
        home: SafeArea(
          child: MyHomePage(),
        ));
  }
}
