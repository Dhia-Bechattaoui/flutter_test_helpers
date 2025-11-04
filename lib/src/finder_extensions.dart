import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Extension methods for Finder
extension FinderExtensions on Finder {
  /// Checks if exactly one widget is found
  bool get hasOne => evaluate().length == 1;

  /// Checks if multiple widgets are found
  bool get hasMultiple => evaluate().length > 1;

  /// Gets the first widget, or null if none found
  Widget? get firstWidget {
    final Iterable<Widget> widgets = evaluate().map((Element e) => e.widget);
    return widgets.isEmpty ? null : widgets.first;
  }

  /// Gets all widgets found
  List<Widget> get allWidgets =>
      evaluate().map((Element e) => e.widget).toList();

  /// Gets the first element, or null if none found
  Element? get firstElement {
    final Iterable<Element> elements = evaluate();
    return elements.isEmpty ? null : elements.first;
  }

  /// Gets all elements found
  List<Element> get allElements => evaluate().toList();
}
