import 'dart:math';

import 'package:flutter/material.dart';

/// Extension methods for common Flutter types
extension ColorExtensions on Color {
  /// Creates a lighter version of the color
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor lighterHsl = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lighterHsl.toColor();
  }

  /// Creates a darker version of the color
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor darkerHsl = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return darkerHsl.toColor();
  }

  /// Creates a more saturated version of the color
  Color saturate([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor saturatedHsl = hsl.withSaturation(
      (hsl.saturation + amount).clamp(0.0, 1.0),
    );
    return saturatedHsl.toColor();
  }

  /// Creates a less saturated version of the color
  Color desaturate([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor desaturatedHsl = hsl.withSaturation(
      (hsl.saturation - amount).clamp(0.0, 1.0),
    );
    return desaturatedHsl.toColor();
  }

  /// Gets the contrast color (black or white) for this color
  Color get contrastColor {
    final double luminance = computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  /// Converts the color to a hex string
  String toHex() {
    final rHex = (r * 255).round().toRadixString(16).padLeft(2, '0');
    final gHex = (g * 255).round().toRadixString(16).padLeft(2, '0');
    final bHex = (b * 255).round().toRadixString(16).padLeft(2, '0');
    return '#$rHex$gHex$bHex';
  }
}

/// Extension methods for String
extension StringExtensions on String {
  /// Capitalizes the first letter of the string
  String get capitalize {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalizes the first letter of each word
  String get titleCase {
    if (isEmpty) {
      return this;
    }
    return split(' ').map((String word) => word.capitalize).join(' ');
  }

  /// Truncates the string to a specified length
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) {
      return this;
    }
    return '${substring(0, maxLength - suffix.length)}$suffix';
  }

  /// Checks if the string is a valid email
  bool get isEmail {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  /// Checks if the string is a valid URL
  bool get isUrl {
    try {
      final Uri uri = Uri.parse(this);
      return uri.hasScheme && uri.hasAuthority;
    } catch (_) {
      return false;
    }
  }

  /// Removes all whitespace from the string
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Reverses the string
  String get reversed => split('').reversed.join('');
}

/// Extension methods for DateTime
extension DateTimeExtensions on DateTime {
  /// Checks if the date is today
  bool get isToday {
    final DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Checks if the date is yesterday
  bool get isYesterday {
    final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Checks if the date is tomorrow
  bool get isTomorrow {
    final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Gets the start of the day (00:00:00)
  DateTime get startOfDay => DateTime(year, month, day);

  /// Gets the end of the day (23:59:59)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999, 999);

  /// Gets the start of the week (Monday)
  DateTime get startOfWeek {
    final int daysFromMonday = weekday - 1;
    return subtract(Duration(days: daysFromMonday)).startOfDay;
  }

  /// Gets the end of the week (Sunday)
  DateTime get endOfWeek {
    final int daysUntilSunday = 7 - weekday;
    return add(Duration(days: daysUntilSunday)).endOfDay;
  }

  /// Gets the start of the month
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Gets the end of the month
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999, 999);

  /// Gets the start of the year
  DateTime get startOfYear => DateTime(year, 1, 1);

  /// Gets the end of the year
  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59, 999, 999);

  /// Formats the date as a relative time string
  String get relativeTime {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(this);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      final hours = difference.inHours;
      return '$hours hour${hours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      final minutes = difference.inMinutes;
      return '$minutes minute${minutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
}

/// Extension methods for List
extension ListExtensions<T> on List<T> {
  /// Gets a random element from the list
  T? get random {
    if (isEmpty) {
      return null;
    }
    final Random random = Random();
    return this[random.nextInt(length)];
  }

  /// Shuffles the list and returns a new shuffled list
  List<T> get shuffled {
    final List<T> newList = List<T>.from(this);
    newList.shuffle();
    return newList;
  }

  /// Gets the first element or null if the list is empty
  T? get firstOrNull => isEmpty ? null : first;

  /// Gets the last element or null if the list is empty
  T? get lastOrNull => isEmpty ? null : last;

  /// Adds an element if it's not already in the list
  void addIfNotExists(T element) {
    if (!contains(element)) {
      add(element);
    }
  }

  /// Gets elements at even indices
  List<T> get evenIndices => asMap().entries
      .where((MapEntry<int, T> entry) => entry.key.isEven)
      .map((MapEntry<int, T> entry) => entry.value)
      .toList();

  /// Gets elements at odd indices
  List<T> get oddIndices => asMap().entries
      .where((MapEntry<int, T> entry) => entry.key.isOdd)
      .map((MapEntry<int, T> entry) => entry.value)
      .toList();
}
