import 'package:flutter/material.dart';
import 'package:graphql_intro/entities/character.entity.dart';

class CharacterDisplay extends StatelessWidget {
  final Character character;

  CharacterDisplay({@required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(character.image),
        ),
        Expanded(
            child: Center(
          child: Text(
            "Full Name: ${character.name}\nNative Name: ${character.nativeName}",
          ),
        ))
      ],
    );
  }
}
