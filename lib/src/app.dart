import 'package:flutter/material.dart';
import 'ui/pokeList.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      home: PokeList(),
    );
  }
}