class Fruit {
  var _current = 0;
  bool _done = false;
  List<String> _fruits = [
    "LOVE",
    "JOY",
    "PEACE",
    "GENTELNESS",
    "KINDNESS",
    "FAITHFULNESS",
    "GOODNESS",
    "SELF-CONTROL",
    "PATIENCE"
  ];
  List<String> _colors;
  List<String> _description = [
    "Love is when you are able to care, more than you ever thought  was possible. When you forgive someone, even without them explaining themself. Love is when you enjoy someone’s presence and wish that, that moment would last forever.  We’re not only talking about romantic love.  It can be loving your mom, children, grandma, cousin , friend, or even someone you met by circumstance.  And even though you only got to spend a short time with him or her.  The encounter impacted you greatly and made the day a blessing. Because what was exchanged was memorable and had a lasting effect.Please rate yourself on a scale of (0-85) ",
    "The ability to feel pleasure in living and sharing with others.  Bringing up a beautiful beam with your presence and smile.  Wanting to spread joy and your good success with everyone and that they themselves can share in that joy .Please rate yourself on a scale of (0-85)",
    "Being in harmony and a state of understanding and tranquility with the world and with yourself, always being able to find the calm after the storm and having hope for the future ahead.Please rate yourself on a scale of (0-85)",
    "Acting in purity of thought, caring about people’s hearts and souls. Respectful to people in their current life/belief systems without prejudice or judgement. Understanding people's hearts are fragile as glass and we are so needed to take good care of them and be concerned for their well being. Please rate yourself on a scale of (0-85)",
    "Sharing, giving help whenever you can, even without being asked. Knowing that a simple gesture can make another person’s day. Wanting for others, what you want for yourself, because someone else's beauty or success doesn’t mean the absence of yours.Please rate yourself on a scale of (0-85) ",
    "We all have a purpose in life, realizing it is in relation with God, while fulfilling our quest for this life.   Simply to have faith in God because He only wants the best for all of us.  We also need to have faith in people and that we can live in peace and develop trust with each other.  Giving everyone a fair chance and believing that  they can too become trustworthy with an appropriate situation to prove themselves.  Always encouraging them by example, and showing fairness and loyalty to each other.  Please rate yourself on a scale of (0-85)",
    "Good is the combination of care, kindness and joy.  It's just the mean of all these states that just make you feel GOOD.  Maybe you can’t describe it exactly but at a given moment, you know that you are just fine. Please rate yourself on a scale of (0-85)",
    "Being able to confront yourself and stop when unnecessary action will harm yourself or another.   When you go too far against what is appropriate behaviour, in harming yourself or other people.  Consciously controlling your emotions but not in a way that you bottle them up and it stop you from breathing.  Always considering all the factors involved  and finding the best solution that will work for both of you Please rate yourself on a scale of (0-85) ",
    "Patience is rewarded (the best type of reward) no matter how much you endure, how hard it may be, how impossible that it may seem, you persevere.  You are patient because you have strong faith in God and know He will show you the best way to go.  Please rate yourself on a scale of (0-85)"
  ];
  List<String> _Images = [
    "love.jpg",
    "joy.jpg",
    "Peace.jpg",
    "Gentelness.jpg",
    "Kindness.jpg",
    "Faithfulness.jpg",
    "Goodness.jpg",
    "Self-Control.jpg",
    "Patience.jpg"
  ];

  String getFruitImg() {
    return _Images[_current];
  }

  String getfruit() {
    return _fruits[_current];
  }

  String getdescription() {
    return _description[_current];
  }

  String getColor() {
    return _colors[_current];
  }

  bool getDone() {
    return _done;
  }

  int getCurrent() {
    return _current;
  }

  void next() {
    if (_current < 8) {
      _current++;
    } else {
      _done = true;
    }
  }

  void resetCurrent() {
    _current = 0;
  }

  void resetDone() {
    _done = false;
  }
}
