import 'package:flutter/material.dart';
import 'package:tim_app_build/login/designPage.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3,
              color: Colors.blue[900],
              child: const Image(
                image: AssetImage('images/favicon.png'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            const Text(
              "BILLSOFT",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            const Text(
              "    Application de Gestionnaire\n d'entrées et de sorties de caisse",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            Container(
              child: ElevatedButton(
                child: const Text(
                  'Commencer',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DesignPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
