

import 'dart:math';

class HelperFunctions {
  static Map<String, String> getRandomMap(List<Map<String, String>> maps) {
  if (maps.isEmpty) {
    throw ArgumentError('The list cannot be empty.');
  }

  final random = Random();
  final randomIndex = random.nextInt(maps.length);
  return maps[randomIndex];
}
}