import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[600],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/night3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "IWANCIW Functional Funware: A color design experience",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ]),
              child: SizedBox(
                height: 60,
                width: 300,
                child: RaisedButton(
                  elevation: 6,
                  color: Colors.orange[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  },
                  child: Text(
                    "See Your Color",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ]),
              child: SizedBox(
                height: 60,
                width: 300,
                child: RaisedButton(
                  elevation: 6,
                  color: Colors.orange[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    launch("https://www.iwanciw.com/");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Colors that speak to you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
