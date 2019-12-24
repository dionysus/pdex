import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LinearBar extends StatelessWidget{

	const LinearBar({
		Key key,
		this.fill,
		this.max = 255,
		this.fillColor = Colors.red,
		this.bgColor = Colors.grey
	}) : super(key: key);

	final fill;
	final max;
	final fillColor;
	final bgColor;

	@override
	Widget build(BuildContext context){
		return Row(
			children:[ 
			Flexible(
				fit: FlexFit.tight,
				flex: fill,
				child: FillBox(color: fillColor),
			),
			Flexible(
				fit: FlexFit.tight,
				flex: max - fill,
				child: FillBox(color: bgColor),
				)
			]
		);
	}
}

class FillBox extends StatelessWidget {

	const FillBox({
		Key key,
		this.color,
	}) : super(key: key);

	final color;

	@override
	Widget build(BuildContext context){
		return Container(
			height: 5,
			decoration: BoxDecoration(
				color: color,
				// border: Border.all(),
			)
		);
	}
}