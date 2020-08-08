import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/buy_screen/buy_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'data/list_products_data.dart';
import 'utils/routes.dart';

class ComprasdoSeuZeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListProductData(),
      child: MaterialApp(
        routes: {
          Routes.HOME_SCREEN: (context) => HomeScreen(),
          Routes.BUY_SCREEN: (context) => BuyScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(),
          backgroundColor: Color(0xFF31A2CE),
          scaffoldBackgroundColor: Color(0xFFC9DAE2),
          primaryColor: Color(0xFFC9DAE2),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            centerTitle: true,
            color: Color(0xFF31A2CE),
            iconTheme: IconThemeData(
              color: Color(0xFFC9DAE2),
            ),
          ),
          accentColor: Color(0xFF07375D),
        ),
      ),
    );
  }
}
