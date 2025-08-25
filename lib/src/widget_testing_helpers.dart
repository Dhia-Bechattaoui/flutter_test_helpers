import 'package:flutter/material.dart';

/// Widget testing helpers and extensions
class WidgetTestingHelpers {
  /// Creates a new instance of WidgetTestingHelpers
  const WidgetTestingHelpers();

  /// Creates a simple test widget with padding
  static Widget createPaddedWidget(Widget child, {EdgeInsets? padding}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

  /// Creates a test widget with custom constraints
  static Widget createConstrainedWidget(
    Widget child, {
    double? maxWidth,
    double? maxHeight,
  }) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: child,
      ),
    );
  }

  /// Creates a test widget with custom theme
  static Widget createThemedWidget(
    Widget child, {
    ThemeData? theme,
    bool useMaterial3 = true,
  }) {
    return MaterialApp(
      theme: theme ?? ThemeData(useMaterial3: useMaterial3),
      home: Scaffold(body: child),
    );
  }

  /// Creates a test widget with custom locale
  static Widget createLocalizedWidget(
    Widget child, {
    Locale? locale,
    List<LocalizationsDelegate<dynamic>>? localizationsDelegates,
  }) {
    return MaterialApp(
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      home: Scaffold(body: child),
    );
  }

  /// Creates a test widget with custom media query
  static Widget createMediaQueryWidget(
    Widget child, {
    Size? screenSize,
    double? devicePixelRatio,
    EdgeInsets? padding,
  }) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(
          size: screenSize ?? const Size(375, 812),
          devicePixelRatio: devicePixelRatio ?? 3.0,
          padding: padding ?? EdgeInsets.zero,
        ),
        child: child,
      ),
    );
  }

  /// Creates a test widget with custom navigation
  static Widget createNavigationWidget(
    Widget child, {
    Map<String, WidgetBuilder>? routes,
    String? initialRoute,
  }) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: routes ?? <String, WidgetBuilder>{},
      home: Scaffold(body: child),
    );
  }
}
