import 'package:flutter/material.dart';
import 'package:pdex/src/ui/main_screen.dart';
import 'package:pdex/src/blocs/list_bloc.dart';
import 'package:pdex/src/resources/bloc_provider.dart';
void main() => runApp(PokeDex());

class PokeDex extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return BlocProvider<ListBloc>(
           bloc: ListBloc(),
           child: MaterialApp(
               title: 'PokeDex',
               theme: ThemeData(
                   primarySwatch: Colors.red,
               ),
               home: MainScreen(),
           ),
        );
    }
}