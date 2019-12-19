import 'package:flutter/material.dart';
import 'package:pdex/src/blocs/list_bloc.dart';
import 'package:pdex/src/models/ItemModel.dart';
import 'package:pdex/src/resources/bloc_provider.dart';
import 'package:pdex/src/ui/list_item_tile.dart';


class ListScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final bloc = ListBloc();

        //ToDo: Add filters for pokemon types
        bloc.fetchAllPokemon(); // generate pokemon list on build.

        return BlocProvider<ListBloc>(
            bloc: bloc,
            child: Scaffold(
                appBar: AppBar(
                    title: Text('PokeDex List'),
                ),
                body: _buildBody(bloc),
            )
        );
    }

    Widget _buildBody(ListBloc bloc) {
        return StreamBuilder(
            stream: bloc.listStream, //name of DB Collection
            builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                if (snapshot.hasData) {
                    return _buildList(snapshot.data);
                } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                }
                return LinearProgressIndicator();
            },
        );
    }

    Widget _buildList(ItemModel results) {

        return ListView.builder(
            itemCount: results.results.length,
            itemBuilder: (BuildContext context, int index) {
                final pokemon = results.results[index];
                return ListItemTile(pokemon: pokemon);
            },
        );
    }
}