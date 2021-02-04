class Character {
  final String name;
  final String nativeName;
  final String image;

  Character({this.image, this.name, this.nativeName});

  factory Character.fromJSON(Map<String, dynamic> json) {
    return Character(
      name: json["name"]["full"],
      nativeName: json["name"]["native"],
      image: json["image"]["large"],
    );
  }
}
