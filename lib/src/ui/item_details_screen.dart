
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdex/src/ui/linear_bar.dart';

class ItemDetailsScreen extends StatelessWidget{

	final pokemon;

	const ItemDetailsScreen({Key key, this.pokemon}) : super (key: key);

	@override
	Widget build(BuildContext context){

		return CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text(pokemon.nameCap)
			),
			child: SafeArea(
				child: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Hero(
								tag: pokemon.name + 'Hero',
								child: Image.asset(pokemon.thumb),
							),
							Text(
								pokemon.idString,
								style: TextStyle(fontSize: 10),),
							Text(
								this._getTypes(),
								style: TextStyle(fontSize: 10),),
							SizedBox(height: 10),
							LinearBar(fill: pokemon.hp),
							SizedBox(height: 10),
							LinearBar(fill: pokemon.attack),
							SizedBox(height: 10),
							LinearBar(fill: pokemon.defense),
							SizedBox(height: 10),
							LinearBar(fill: pokemon.speed),
						],
					)
				)
			)
		);
	}

	String _getTypes() {
		return pokemon.type.join(' / ');
	}
}