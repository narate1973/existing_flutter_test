import 'dart:math';

import 'package:flutter/material.dart';

class ColorfulTile extends StatefulWidget {
  ColorfulTile({Key? key}) : super(key: key);

  @override
  _StatefulColorfulTileState createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<ColorfulTile> {
  Color? myColor;

  @override
  void initState() {
    super.initState();
    myColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}
