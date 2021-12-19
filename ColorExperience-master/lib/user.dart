import 'package:shared_preferences/shared_preferences.dart';

class User {
  String _name;
  String _email;
  List<double> _charac = [0, 0, 0];
  String _color;
  int _attempts = 1;

  List getCharac() {
    return _charac;
  }

  List updateIllumination(int value) {
    _charac[0] += value;
    return _charac;
  }

  List updateHue(int value) {
    _charac[1] += value;
    return _charac;
  }

  List updateSaturation(int value) {
    _charac[2] += value;
    return _charac;
  }

  void setColor(String c) {
    _color = c;
  }

  void restChar() {
    _charac = [0, 0, 0];
  }

  int getAttempts() {
    return _attempts;
  }

  void setAttempts(int a) {
    _attempts = a;
  }
}
