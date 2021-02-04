import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_intro/entities/character.entity.dart';
import 'package:graphql_intro/resolvers/character.resolver.dart';
import 'package:graphql_intro/widgets/characterDisplay.ui.dart';

void main() async {
  await initHiveForFlutter();
  runApp(GraphQLIntroApp());
}

class GraphQLIntroApp extends StatefulWidget {
  @override
  _GraphQLIntroAppState createState() => _GraphQLIntroAppState();
}

class _GraphQLIntroAppState extends State<GraphQLIntroApp> {
  HttpLink httpLink;
  ValueNotifier<GraphQLClient> client;
  CharacterResolver characterResolver;

  @override
  void initState() {
    // Initialize HTTP Server Endpoint
    httpLink = HttpLink("https://graphql.anilist.co");

    // Initialize GrapQL Client
    client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: httpLink,
      ),
    );

    //Initalizing Resolvers
    characterResolver = CharacterResolver();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("GraphQL Intro App"),
          ),
          body: Query(
            options: QueryOptions(
              document: gql(characterResolver.query),
              variables: characterResolver.variables(character: "Goku"),
            ),
            builder: (result, {VoidCallback refetch, FetchMore fetchMore}) {
              return CharacterDisplay(
                character: Character.fromJSON(result.data["character"]),
              );
            },
          ),
        ),
      ),
    );
  }
}
