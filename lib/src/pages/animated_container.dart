import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.black;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.bounceIn,
          height: _height,
          width: _width,
          child: Image(image: AssetImage("assets/sticker.png"),),
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {

    final random = Random();
    setState(() {
      _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _width = random.nextInt(400).toDouble(); 
      _height = random.nextInt(600).toDouble();  
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}