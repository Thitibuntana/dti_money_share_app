import 'package:dti_money_share_app/views/money_result_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyInputUI extends StatefulWidget {
  const MoneyInputUI({super.key});

  @override
  State<MoneyInputUI> createState() => _MoneyInputUIState();
}

class _MoneyInputUIState extends State<MoneyInputUI> {
  bool isChecked = false;

  TextEditingController moneyCTRL = TextEditingController();
  TextEditingController personCTRL = TextEditingController();
  TextEditingController tipCTRL = TextEditingController();

  warningDialog(context, msg) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text(
                  'Warning!',
                ),
                content: Text(
                  msg,
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ok'))
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          "Let's share money!",
          style: TextStyle(
            color: Colors.white,
          ),
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
                TextField(
                  controller: moneyCTRL,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter amount of money (Baht)',
                    hintStyle: TextStyle(color: Colors.green[400]),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                TextField(
                  controller: personCTRL,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter the amount of people',
                    hintStyle: TextStyle(color: Colors.green[400]),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      onChanged: (paramValue) {
                        setState(() {
                          isChecked = paramValue!;
                          if (isChecked == false) {
                            tipCTRL.text = '';
                          }
                        });
                      },
                      value: isChecked,
                      activeColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    Text("Tip the waiter/waitress?",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15.0,
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                TextField(
                  controller: tipCTRL,
                  keyboardType: TextInputType.number,
                  enabled: isChecked,
                  decoration: InputDecoration(
                    hintText: 'Enter the tipping amount',
                    hintStyle: TextStyle(color: Colors.green[400]),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ElevatedButton(
                  onPressed: () {
                    double money = 0;
                    int person = 0;
                    double tip = 0;
                    double moneyShare = 0;

                    if (moneyCTRL.text.isEmpty == true) {
                      warningDialog(context, 'Please fill the amount of money');
                      return;
                    } else if (personCTRL.text.isEmpty == true) {
                      warningDialog(
                          context, 'Please fill the amount of people');
                      return;
                    } else if (isChecked == true) {
                      if (tipCTRL.text.isEmpty == true) {
                        warningDialog(context,
                            'Please fill the tip amount or uncheck the box');
                        return;
                      } else {
                        tip = double.parse(tipCTRL.text);
                      }
                    }
                    money = double.parse(moneyCTRL.text);
                    person = int.parse(personCTRL.text);
                    moneyShare = (money + tip) / person;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoneyResultUI(
                              money: money,
                              person: person,
                              tip: tip,
                              moneyShare: moneyShare,
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      MediaQuery.of(context).size.height * 0.065,
                    ),
                  ),
                  child: Text('Calculate',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      moneyCTRL.text = '';
                      personCTRL.text = '';
                      tipCTRL.text = '';
                      isChecked = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                  icon: Icon(
                    Icons.refresh_sharp,
                    color: Colors.white,
                  ),
                  label: Text(' Cancel',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.065),
                Text('Created by Barack Obama',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
