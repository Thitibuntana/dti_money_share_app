import 'package:dti_money_share_app/views/money_input_ui.dart';
import 'package:flutter/material.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  void initState() {
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MoneyInputUI()),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money01.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text("Let's share money!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            CircularProgressIndicator(color: Colors.white)
          ],
        ),
      ),
    );
  }
}
