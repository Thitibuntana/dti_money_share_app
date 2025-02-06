import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyResultUI extends StatefulWidget {
  double? money = 0;
  int? person= 0;
  double? tip= 0;
  double? moneyShare= 0;

  MoneyResultUI({
    super.key,
    this.money,
    this.person,
    this.tip,
    this.moneyShare,
  });

  @override
  State<MoneyResultUI> createState() => _MoneyResultUIState();
}

class _MoneyResultUIState extends State<MoneyResultUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          "Sharing result",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 241, 255, 241),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 40.0,
            right: 40.0,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                Image.asset(
                  'assets/images/money02.png',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                Text(
                  'Amount of money to divide',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  widget.money!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'Baht',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                Text(
                  'Amount of people',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  widget.person.toString(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'People',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                Text(
                  'Tipping amount',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  widget.tip!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'Baht',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                Text(
                  'Conclusive amount per person',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.yellow,
                  ),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Center(
                    child: Text(
                      widget.moneyShare!.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  'Baht',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
