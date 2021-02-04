class CharacterResolver {
  // READ
  final String _query = """
  query ReadCharacter(\$character: String) {
    character: Character(search: \$character) {
      id,
      name {
        full
        native
      },
      image {
        large
      },
      description,
    }
  }
  """;

  String get query => _query;

  Map<String, dynamic> variables({String character}) => {
        "character": character,
      };
}
