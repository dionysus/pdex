
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdex/src/ui/item_details_screen.dart';

class ListItemTile extends StatelessWidget{

    const ListItemTile({
        Key key,
        @required this.pokemon,
    }) : super(key: key);

    final pokemon;

    @override
    Widget build(BuildContext context){
        return ListTile(
            leading: Image.asset(pokemon.thumb),
            title: Text(pokemon.nameCap),
            subtitle: Text(pokemon.idString + " / " + this._getTypes()),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            ItemDetailsScreen(pokemon: pokemon),
                    ),
                );
            }
        );
    }

    String _getTypes() {
        return pokemon.type.join(' / ');
    }
}