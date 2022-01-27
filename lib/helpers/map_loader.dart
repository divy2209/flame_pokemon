import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class MapLoader {
  static Future<List<Rect>> readPokemonCollisionMap() async {
    final collidableRects = <Rect>[];
    final dynamic collisionMap = json.decode(await rootBundle.loadString('assets/pokemon_collision_map.json'));

    for(final dynamic data in collisionMap['objects']){
      collidableRects.add(Rect.fromLTWH(
        data['x'] as double,
        data['y'] as double,
        data['width'] as double,
        data['height'] as double
      ));
    }
    return collidableRects;
  }
}