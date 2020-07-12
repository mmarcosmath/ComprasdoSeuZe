import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/comprasdoseuze_app.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CompasdoSeuZeApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        backgroundColor: Color(0xFF31A2CE),
        scaffoldBackgroundColor: Color(0xFFC9DAE2),
        primaryColor: Color(0xFFC9DAE2),
        accentColor: Color(0xFF07375D),
      ),
    );
  }
}
