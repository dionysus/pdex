import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/list_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'PokeDex',
      home: ListScreen(),
    );
  }
}