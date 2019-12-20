import 'package:flutter/material.dart';
import 'package:pdex/src/blocs/list_bloc.dart';
import 'package:pdex/src/models/ItemModel.dart';
import 'package:pdex/src/resources/bloc_provider.dart';
import 'package:pdex/src/ui/list_screen.dart';

class MainScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return StreamBuilder<ItemModel>(
          stream: BlocProvider.of<ListBloc>(context).listStream,
          builder: (context, snapshot) {
              final pokeList = snapshot.data;

              if (pokeList == null) {
                  return ListScreen();
              }

              //TODO: Replace
              return Container();
          }
        );
    }
}