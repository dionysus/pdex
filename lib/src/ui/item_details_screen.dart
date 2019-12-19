
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDetailsScreen extends StatelessWidget{
    final pokemon;

    const ItemDetailsScreen({Key key, this.pokemon}) : super (key: key);

    @override
    Widget build(BuildContext context){
        final textTheme = Theme.of(context).textTheme;

        return Scaffold(
            appBar: AppBar(
                title: Text(pokemon.nameCap)
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        Image.asset(pokemon.thumb),
                        Text(pokemon.idString),
                        Text(this._getTypes()),
                    ],
                )
            )
        );
    }

    String _getTypes() {
        return pokemon.type.join(' / ');
    }
}