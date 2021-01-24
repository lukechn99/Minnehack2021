class Fact {
  final String name, factText, imagePath;

  Fact({this.name, this.factText, this.imagePath});
}

// local facts. we don't got no database lmao
final facts = [
  Fact(
    name: "Steering wheel deadly?",
    factText: "did you know that steering wheel contains so much things?",
    imagePath: "assets/clean-steering-wheel-step-4.png",
  ),
  Fact(
    name: "If you don't wash...",
    factText: "maybe some more text will be inputted in here",
    imagePath: "assets/full-moon.png",
  ),
  Fact(
    name: "Deadly trips",
    factText: "if you ",
    imagePath: "assets/cute-goat.jpg",
  ),
  Fact(
    name: "Orien Test",
    factText: "fact text....",
    imagePath: "assets/swirl-plant.jpg",
  ),
];
