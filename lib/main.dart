import 'package:dti_money_share_app/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainAppHandle());
}

class MainAppHandle extends StatefulWidget {
  const MainAppHandle({super.key});

  @override
  State<MainAppHandle> createState() => _MainAppHandleState();
}

class _MainAppHandleState extends State<MainAppHandle> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
