import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LinearBar extends StatefulWidget{

	const LinearBar({
		Key key,
		this.fill,
	}) : super(key: key);

	final int fill;

	@override
	_LinearBarState createState() => _LinearBarState();

}

class _LinearBarState extends State<LinearBar> with SingleTickerProviderStateMixin{

	final max = 255;
	final fillColor = Colors.red;
	final bgColor = Colors.red[100];

	Animation animation;
	AnimationController controller;

	@override
	void initState() {
		super.initState();
		controller = new AnimationController(
			vsync: this,
			duration: Duration(seconds: 1)
		);
		IntTween tween = new IntTween(begin: 0, end: widget.fill);
		animation = tween.animate(controller);
		animation.addListener(() {
			setState(() {});
		});
		controller.forward();
	}

	@override
	void dispose() {
		controller.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context){
		return Row(
			children:[
			    Container(
                    width: 50,
                    child: Text(animation.value.toString(),
                        style: TextStyle(fontSize: 10),),
                ),
				Flexible(
					fit: FlexFit.tight,
					flex: animation.value,
					child: FillBox(color: fillColor),
				),
				Flexible(
					fit: FlexFit.tight,
					flex: max - animation.value,
					child: FillBox(color: bgColor),
				),
                Container(
                    width: 50,
                    child: Text(animation.value.toString().padLeft(3, '0'),
                        style: TextStyle(fontSize: 10),),
                ),
//                SizedBox(
//                    width: 50,
//                )
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