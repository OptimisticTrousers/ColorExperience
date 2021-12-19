import 'package:flutter/material.dart';
import '../fruit.dart';
import '../user.dart';
import '../constants.dart';
import 'package:see_color/Screens/rating.dart';

class First extends StatelessWidget {
  bool start = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BACKGROUND01.png"), fit: BoxFit.fill),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/myangellineup.jpg"))),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Find Your Color!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        fontFamily: "DancingScript-VariableFont_wght"),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Container(
                    child: RaisedButton(
                        elevation: 8,
                        color: Colors.pink[100],
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 110),
                          leading: Text(
                            "Start",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ),
                        onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context){return RatingPage();} ));
                          // setState(() {
                          //   start = false;
                          //   sample.next();
                          //   rating1 = 0;
                          // });
                        }),
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
