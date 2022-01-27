import 'dart:math';

import 'package:flame_pokemon/helpers/direction.dart';
import 'package:flutter/material.dart';

class JoyPad extends StatefulWidget {
  final ValueChanged<Direction>? onDirectionChanged;
  const JoyPad({Key? key, this.onDirectionChanged}) : super(key: key);

  @override
  _JoyPadState createState() => _JoyPadState();
}

class _JoyPadState extends State<JoyPad> {
  Direction direction = Direction.none;
  Offset delta = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
        ),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0x88ffffff)
            ),
            child: Center(
              child: Transform.translate(
                offset: delta,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xccffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
          onPanDown: onDragDown,
          onPanUpdate: onDragUpdate,
          onPanEnd: onDragEnd,
        ),
      ),
    );
  }

  void updateDelta(Offset newDelta) {
    final newDirection = getDirectionFromOffset(newDelta);

    if(newDirection != direction){
      direction = newDirection;
      widget.onDirectionChanged!(direction);
    }

    setState(() {
      delta = newDelta;
    });
  }

  Direction getDirectionFromOffset(Offset offset){
    if(offset.dx>20) {
      return Direction.right;
    } else if(offset.dx<-20) {
      return Direction.left;
    } else if(offset.dy>20) {
      return Direction.down;
    } else if(offset.dy<-20) {
      return Direction.up;
    }
    return Direction.none;
  }

  void onDragDown(DragDownDetails d){
    calculateDelta(d.localPosition);
  }
  void onDragUpdate(DragUpdateDetails d){
    calculateDelta(d.localPosition);
  }
  void onDragEnd(DragEndDetails d){
    calculateDelta(Offset.zero);
  }

  void calculateDelta(Offset offset) {
    final newDelta = offset-const Offset(60,60);
    updateDelta(
      Offset.fromDirection(newDelta.direction, min(30,newDelta.distance))
    );
  }
}
