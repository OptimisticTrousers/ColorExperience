import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import '../fruit.dart';
import '../user.dart';
import '../Screens/Result.dart';
import 'package:audioplayers/audioplayers.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int rating1 = 0, rating2 = 0;
  Fruit sample = Fruit();
  User user1 = User();
  Color myColor;
  String hex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final player = AudioCache();
    player.loop(('in-his-name.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    double u0 = (user1.getCharac()[0]);
    double u1 = (user1.getCharac()[1]);
    double u2 = (user1.getCharac()[2]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      height: 320,
                      width: 130,
                      alignment: Alignment.center,
                      child: Image.asset("assets/${sample.getFruitImg()}")),
                  Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(sample.getfruit(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold)),
                      ),
                      //SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        height: 380,
                        width: 195,
                        child: Text(
                          sample.getdescription(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 4.0,
                            valueIndicatorTextStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                            showValueIndicator: ShowValueIndicator.always,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: rating1.toDouble(),
                            onChanged: (double newRating) {
                              setState(
                                () {
                                  rating1 = newRating.toInt();
                                  print("am rating1 $rating1");
                                  rating2 = rating1;
                                  print("am rating2 $rating2");
                                },
                              );
                            },
                            max: 85.0,
                            min: 0.0,
                            label: '$rating2',
                            activeColor: Colors.blue[900],
                            inactiveColor: Colors.lightBlue[300],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // decoration: kButtonDecoration,
                      width: 200.0,
                      child: RaisedButton(
                        elevation: 8,
                        color: Colors.purple[400],
                        child: ListTile(
                          leading: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                          title: Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          print("pressed");
                          setState(() {
                            print(sample.getCurrent());
                            rating2 = rating1;
                            if (sample.getCurrent() < 9) {
                              if (sample.getCurrent() < 3) {
                                user1.updateIllumination(rating2);
                              } else {
                                if (sample.getCurrent() < 6) {
                                  user1.updateHue(rating2);
                                } else {
                                  user1.updateSaturation(rating2);
                                }
                              }
                            }
                            rating1 = 0;
                            print("heelooo");
                            print(user1.getCharac());

                            myColor = Color.fromRGBO(
                                u0.round(), u1.round(), u2.round(), 1.0);
                            hex = '#${myColor.value.toRadixString(16)}';
                            sample.next();

                            if (sample.getDone()) {
                              print("done");
                              print("$hex");
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return ResultPage(
                                  user: user1,
                                  hex: hex,
                                );
                              }));
                            }
                            print(sample.getDone());
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
