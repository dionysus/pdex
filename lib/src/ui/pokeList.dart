import 'package:flutter/material.dart';
import '../models/ItemModel.dart';
import '../blocs/pokeList_bloc.dart';

class PokeList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        bloc.fetchAllPokemon();
        return Scaffold(
            appBar: AppBar(
                title: Text('PokeDex List'),
                backgroundColor: Colors.red,
            ),
            body: _buildBody(context),
        );
    }

    Widget _buildBody(BuildContext context) {
        return StreamBuilder(
            stream: bloc.allPokemon, //name of DB Collection
            builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                if (snapshot.hasData) {
                    return _buildList(snapshot);
                } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                }
                return LinearProgressIndicator();
            },
        );
    }

    Widget _buildList(AsyncSnapshot<ItemModel> snapshot) {

        return ListView.builder(
            itemCount: snapshot.data.results.length,
            itemBuilder: (BuildContext context, int index) {
                var indiv = snapshot.data.results[index];
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                        leading: Image.asset('assets/images/pokeThumbs/'+ indiv.id.toString() + '.png'),
                        title: Text(indiv.name),
                        trailing: Text("ID: " +  indiv.id.toString().padLeft(4, '0')),
                ));
            } //itemBuilder
        );
    }
}