import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'feedbackQsts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Feedbacks extends StatefulWidget {
  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  final _firestore = Firestore.instance;
  static DocumentReference id;
  List<String> qst = [];
  bool _saving = false;
  int i = 0, attempts;
  String tmp;
  TextEditingController _controller = new TextEditingController();
  feedbackQsts qsts = feedbackQsts();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        centerTitle: true,
        title: Text(
          "Give us your feedback ",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 10.0),
            child: Container(
                child: Column(children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${qsts.getQst()}",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Nunito",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type your answer ...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                        )),
                    onChanged: (var value) {
                      tmp = value;
                      print(tmp);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                width: 180,
                height: 60,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    )),
                    elevation: 8,
                    color: Colors.blue,
                    onPressed: () async {
                      print(qst);
                      if (qsts.getCurrent() < 7) {
                        setState(() {
                          qst.add(tmp);
                          tmp = "";
                          _controller.clear();
                          i++;
                          qsts.next();
                        });
                      } else {
                        setState(() {
                          qst.add(tmp);

                          _saving = true;
                        });
                        try {
                          DocumentReference id =
                              await _firestore.collection("Feedbacks").add({
                            "What were your thoughts when you started filling the form?":
                                qst[0],
                            "What feelings did you have during this experience?":
                                qst[1],
                            "How did the definition of each fruit impact your reflection on it?":
                                qst[2],
                            "How would you describe your reaction/impression when you received your color?":
                                qst[3],
                            "Does the color family of your color have a meaning to you/speaks to you/has to do with something in your life?":
                                qst[4],
                            "Thank you! In one statement how would you describe Seeing your color experience:":
                                qst[5],
                            "Can we publish your experience in our review section?":
                                qst[6],
                            "We would just want to have your email:": qst[7]
                          });
                        } catch (e) {
                          print(e);
                        }

                        await setAttempts_1();
                        setState(() {
                          _saving = false;
                        });
                        print("am in feedback");
                        print(attempts);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return YourColor();
                        }));
                      }
                    },
                    child: Text(
                      "Thank you! Next",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              )
            ])),
          ),
        ),
      ),
    );
  }
}
