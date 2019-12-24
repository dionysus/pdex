
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdex/src/ui/linear_bar.dart';

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
						SizedBox(height: 10),
						LinearBar(fill: pokemon.hp.toDouble()),
						SizedBox(height: 10),
						LinearBar(fill: pokemon.attack.toDouble()),
						SizedBox(height: 10),
						LinearBar(fill: pokemon.defense.toDouble()),
						SizedBox(height: 10),
						LinearBar(fill: pokemon.speed.toDouble()),
					],
				)
			)
		);
	}

	String _getTypes() {
		return pokemon.type.join(' / ');
	}
}