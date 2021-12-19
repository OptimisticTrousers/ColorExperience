import 'package:flutter/material.dart';
import 'feedbacks.dart';
import 'Done.dart';
import '../user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultPage extends StatefulWidget {
  ResultPage({@required this.user, this.hex});
  User user;
  String hex = "";
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int attempts = 0;
  _loadAttempts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //prefs.setInt('attempts', 0);
      attempts = (prefs.getInt('attempts'));
      print("loaded Results");
      print(attempts);
    });
  }

  setAttempts_1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    attempts = (prefs.getInt('attempts'));
    setState(() {
      print("attempts in feedback $attempts");
      attempts++;
      prefs.setInt('attempts', attempts);
      print("set1");
      print(attempts);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAttempts_1();
  }

  @override
  Widget build(BuildContext context) {
    double u0 = (widget.user.getCharac()[0]);
    double u1 = (widget.user.getCharac()[1]);
    double u2 = (widget.user.getCharac()[2]);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/81744.jpg"), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("It's a lovely color",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              SizedBox(height: 30),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(
                          u0.round(), u1.round(), u2.round(), 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 8.0),
                      ]),
                  alignment: Alignment.center,
                  width: 180,
                  height: 180,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "${widget.hex}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 25),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Text(
                    "Fill the feedback form & try again",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 280,
                height: 50,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    color: Colors.cyan[200],
                    elevation: 12,
                    onPressed: (() async {
                      await _loadAttempts();
                      print("attempts in result $attempts");
                      if (attempts == 1) {
                        print("attempts in result $attempts");
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Feedbacks();
                        }));
                      } else {
                        // print("attempts in result $attempts");
                        // SharedPreferences prefs =
                        //     await SharedPreferences.getInstance();
                        // setState(() {
                        //   prefs.setInt('attempts', 3);
                        // });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Done();
                        }));
                      }
                    }),
                    child: Text(
                      "Try Again ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Text(
                    "Or...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 280,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  color: Colors.cyan[200],
                  elevation: 12,
                  onPressed: () {
                    launch("https://www.iwanciw.com/");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "See Colors that speak to you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
