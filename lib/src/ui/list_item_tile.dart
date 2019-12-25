
import 'package:flutter/cupertino.dart';
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
        return GestureDetector(
            child: Column(
                children: <Widget>[
                    Hero(
                        tag: pokemon.name + 'Hero',
                        child: Image.asset(pokemon.sprite),
                    ),
                    Text(
                        pokemon.nameCap,
                        style: TextStyle(fontSize: 10),
                    ),
                    Text(
                        pokemon.idString + " / " + this._getTypes(),
                        style: TextStyle(fontSize: 10),
                    ),
                ],
            ),
            onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) {
                    return ItemDetailsScreen(pokemon: pokemon);
                }));
            },
        );
    }

    String _getTypes() {
        return pokemon.type.join(' / ');
    }
}