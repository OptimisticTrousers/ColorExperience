import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'feedbacks.dart';
import 'Done.dart';
import 'Rating.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int attempts;
  bool start = true;
  _loadAttempts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //prefs.setInt('attempts', 0);
      attempts = (prefs.getInt('attempts'));
      if (attempts == null) {
        prefs.setInt('attempts', 0);
        attempts = (prefs.getInt('attempts'));
      }
      print("loaded Home");
      print(attempts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Container(
                    child: Text(
                  " The 9 Enforcers",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      fontFamily: "Nunito-Regular"),
                )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 350,
                    child: Text(
                      " ASSIST in God's will to PROTECT you in the pursuit of God's plan and PROMOTE his promises.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        fontFamily: "Nunito",
                      ),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 210,
                  width: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/myangellineup.jpg"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Find Your Color!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: "DancingScript-VariableFont_wght"),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 180,
                    height: 45,
                    child: RaisedButton(
                        elevation: 8,
                        color: Colors.orange[700],
                        child: Text("Start",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 25)),
                        onPressed: () async {
                          await _loadAttempts();

                          print("inside home $attempts");
                          if (attempts == 0 || attempts == 2) {
                            final player = AudioCache();
                            player.loop(('in-his-name.mp3'));
                            print("0 or 1");
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return RatingPage();
                            }));
                          } else {
                            if (attempts == 1) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Feedbacks();
                              }));
                            } else {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Done();
                              }));
                            }
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
        //  ),
      ),
    );
  }
}
