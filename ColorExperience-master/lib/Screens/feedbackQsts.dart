class feedbackQsts {
  int _current = 0;
  List<String> Qsts = [
    "What were your thoughts when you started filling the form?",
    "What feelings did you have during this experience?",
    "How did the definition of each fruit impact your reflection on it?",
    "How would you describe your reaction/impression when you received your color?",
    "Does the color family of your color have a meaning to you/speaks to you/has to do with something in your life?",
    "Thank you! In one statement how would you describe Seeing your color experience:",
    "Can we publish your experience in our review section?",
    "We would just want to have your email:"
  ];

  int getCurrent() {
    return _current;
  }

  String getQst() {
    return Qsts[_current];
  }

  int next() {
    if (_current < 8) {
      _current++;
    }
  }
}
