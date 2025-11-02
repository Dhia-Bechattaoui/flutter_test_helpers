import 'dart:math';

import 'package:flutter/material.dart';

/// Mock data generators for common Flutter data types
class MockDataGenerators {
  MockDataGenerators._(); // Prevent instantiation

  static final Random _random = Random();

  /// Generates a random color
  static Color randomColor() => Color.fromARGB(
    255,
    _randomInt(0, 255),
    _randomInt(0, 255),
    _randomInt(0, 255),
  );

  /// Generates a random string of specified length
  static String randomString([int length = 10]) {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(
      Iterable<int>.generate(
        length,
        (int index) => chars.codeUnitAt(_randomInt(0, chars.length - 1)),
      ),
    );
  }

  /// Generates a random integer between min and max (inclusive)
  static int randomInt(int min, int max) => _randomInt(min, max);

  /// Generates a random double between min and max
  static double randomDouble(double min, double max) =>
      min + (max - min) * _randomDouble();

  /// Generates a random boolean
  static bool randomBool() => _randomInt(0, 1) == 1;

  /// Generates a random date within the last year
  static DateTime randomDate() {
    final DateTime now = DateTime.now();
    final DateTime oneYearAgo = now.subtract(const Duration(days: 365));
    final int daysDiff = now.difference(oneYearAgo).inDays;
    return oneYearAgo.add(Duration(days: _randomInt(0, daysDiff)));
  }

  /// Generates a list of random strings
  static List<String> randomStringList([int count = 5]) =>
      List<String>.generate(count, (int index) => randomString());

  /// Generates a list of random integers
  static List<int> randomIntList([int count = 5]) =>
      List<int>.generate(count, (int index) => _randomInt(0, 100));

  /// Generates a list of random colors
  static List<Color> randomColorList([int count = 5]) =>
      List<Color>.generate(count, (int index) => randomColor());

  // Helper methods
  static int _randomInt(int min, int max) =>
      min + _random.nextInt(max - min + 1);

  static double _randomDouble() => _random.nextDouble();
}
