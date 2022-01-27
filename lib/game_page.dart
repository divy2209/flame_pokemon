import 'package:flame_pokemon/helpers/direction.dart';
import 'package:flame_pokemon/helpers/joypad.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          // TODO 1
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: JoyPad(onDirectionChanged: onJoyPadDirectionChanged),
            ),
          )
        ],
      ),
    );
  }

  void onJoyPadDirectionChanged(Direction direction){
    // TODO 2
  }
}
