import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjkode/pages/details_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Rick and Morty',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeId:
            return MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            );
          case DetailsPage.routeId:
            final args = settings.arguments as int;
            return MaterialPageRoute(
              builder: (context) {
                return DetailsPage(
                  characterId: args,
                );
              },
            );
          default:
            return null;
        }
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
