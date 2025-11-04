# flutter_test_helpers

[![Pub Version](https://img.shields.io/pub/v/flutter_test_helpers)](https://pub.dev/packages/flutter_test_helpers)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.32.0-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/dart-%3E%3D3.8.0-blue.svg)](https://dart.dev/)
[![Platform Support](https://img.shields.io/badge/platforms-iOS%20%7C%20Android%20%7C%20Web%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-blue.svg)](https://flutter.dev/multi-platform)
[![WASM Compatible](https://img.shields.io/badge/WASM-Compatible-green.svg)](https://dart.dev/wasm)

A comprehensive Flutter package providing mock data generators, test utilities, and widget testing helpers to streamline your Flutter testing workflow.

## Demo

<table>
<tr>
<td width="33%">

**Test Utilities & Helpers**

<img src="https://raw.githubusercontent.com/Dhia-Bechattaoui/flutter_test_helpers/main/assets/gifs/utilities.gif" alt="Test Utilities" width="100%" />

Demonstrates test utilities, WidgetTester extensions, and Finder extensions for comprehensive widget testing.

</td>
<td width="33%">

**Color Extensions**

<img src="https://raw.githubusercontent.com/Dhia-Bechattaoui/flutter_test_helpers/main/assets/gifs/color-extensions.gif" alt="Color Extensions" width="100%" />

Demonstrates color manipulation utilities including lightening, darkening, saturation, and contrast color calculation.

</td>
<td width="33%">

**String Extensions**

<img src="https://raw.githubusercontent.com/Dhia-Bechattaoui/flutter_test_helpers/main/assets/gifs/string-extensions.gif" alt="String Extensions" width="100%" />

Shows various string utilities like capitalization, title case, truncation, email/URL validation, and string reversal.

</td>
</tr>
<tr>
<td width="33%">

**DateTime Extensions**

<img src="https://raw.githubusercontent.com/Dhia-Bechattaoui/flutter_test_helpers/main/assets/gifs/datetime-extensions.gif" alt="DateTime Extensions" width="100%" />

Displays date and time boundary calculations such as start/end of day, week, month, and year, plus relative time formatting.

</td>
<td width="33%">

**List Extensions**

<img src="https://raw.githubusercontent.com/Dhia-Bechattaoui/flutter_test_helpers/main/assets/gifs/list-extensions.gif" alt="List Extensions" width="100%" />

Demonstrates list manipulation operations including random element selection, shuffling, null-safe accessors, and index filtering.

</td>
</tr>
</table>

## Features

- 🎲 **Mock Data Generators**: Generate random test data for colors, strings, numbers, dates, and more
- 🧪 **Test Utilities**: Helper functions for common testing scenarios
- 🎯 **Widget Testing Helpers**: Extensions and utilities for widget testing
- 🔧 **Extensions**: Useful extensions for common Flutter types (Color, String, DateTime, List)
- 🌍 **Multi-Platform Support**: Supports all 6 platforms (iOS, Android, Web, Windows, macOS, Linux)
- ⚡ **WASM Compatible**: Ready for Flutter WebAssembly
- 📱 **Flutter 3.32+**: Built with the latest Flutter features

## Getting Started

### Installation

Add `flutter_test_helpers` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_test_helpers: ^0.1.0
```

### Import

```dart
import 'package:flutter_test_helpers/flutter_test_helpers.dart';
```

## Usage

### Mock Data Generators

Generate random test data for your tests:

```dart
// Generate random colors
final color = MockDataGenerators.randomColor();
final colorList = MockDataGenerators.randomColorList(5);

// Generate random strings
final string = MockDataGenerators.randomString(15);
final stringList = MockDataGenerators.randomStringList(3);

// Generate random numbers
final intValue = MockDataGenerators.randomInt(1, 100);
final doubleValue = MockDataGenerators.randomDouble(0.0, 1.0);

// Generate random dates
final date = MockDataGenerators.randomDate();

// Generate random booleans
final boolValue = MockDataGenerators.randomBool();
```

### Test Utilities

Create test apps and wait for conditions:

```dart
// Create a test app
final app = TestUtilities.createTestApp(MyWidget());
final themedApp = TestUtilities.createTestAppWithTheme(MyWidget(), myTheme);

// Wait for conditions
await TestUtilities.waitForCondition(() => someCondition);

// Find widgets
final finder = TestUtilities.findByKey(Key('my-key'));
final textFinder = TestUtilities.findByText('Hello World');

// Interact with widgets
await TestUtilities.tap(tester, finder);
await TestUtilities.enterText(tester, finder, 'New Text');
await TestUtilities.scrollTo(tester, finder);
```

### Widget Testing Helpers

Create specialized test widgets:

```dart
// Create padded widget
final paddedWidget = WidgetTestingHelpers.createPaddedWidget(
  MyWidget(),
  padding: EdgeInsets.all(16.0),
);

// Create constrained widget
final constrainedWidget = WidgetTestingHelpers.createConstrainedWidget(
  MyWidget(),
  maxWidth: 300,
  maxHeight: 200,
);

// Create themed widget
final themedWidget = WidgetTestingHelpers.createThemedWidget(
  MyWidget(),
  theme: ThemeData(primarySwatch: Colors.blue),
);

// Create localized widget
final localizedWidget = WidgetTestingHelpers.createLocalizedWidget(
  MyWidget(),
  locale: Locale('en', 'US'),
);

// Create media query widget
final mediaQueryWidget = WidgetTestingHelpers.createMediaQueryWidget(
  MyWidget(),
  screenSize: Size(800, 600),
  devicePixelRatio: 2.0,
);
```

### Extensions

Use helpful extensions on common Flutter types:

```dart
// Color extensions
final lighterColor = Colors.blue.lighten(0.2);
final darkerColor = Colors.blue.darken(0.2);
final contrastColor = Colors.blue.contrastColor;
final hexString = Colors.red.toHex();

// String extensions
final capitalized = 'hello'.capitalize; // 'Hello'
final titleCase = 'hello world'.titleCase; // 'Hello World'
final truncated = 'long text'.truncate(5); // 'lo...'
final isValidEmail = 'test@example.com'.isEmail; // true

// DateTime extensions
final isToday = someDate.isToday;
final startOfDay = someDate.startOfDay;
final relativeTime = someDate.relativeTime; // '2 hours ago'

// List extensions
final randomElement = [1, 2, 3, 4, 5].random;
final shuffled = [1, 2, 3, 4, 5].shuffled;
final firstOrNull = [].firstOrNull; // null
```

### WidgetTester Extensions

Use convenient extensions on WidgetTester:

```dart
// Tap by key, text, or type
await tester.tapByKey(Key('my-button'));
await tester.tapByText('Click me');
await tester.tapByType<ElevatedButton>();

// Enter text by key or type
await tester.enterTextByKey(Key('my-field'), 'Hello');
await tester.enterTextByType<TextField>('World');

// Scroll to widgets
await tester.scrollToKey(Key('my-widget'));
await tester.scrollToText('Hidden text');

// Wait for widgets
await tester.waitForWidget(find.byType(MyWidget));
await tester.waitForWidgetToDisappear(find.byType(LoadingWidget));
```

### Finder Extensions

Use helpful extensions on Finder:

```dart
// Check finder state
if (finder.hasOne) {
  // Exactly one widget found
}
if (finder.hasMultiple) {
  // Multiple widgets found
}

// Get widgets and elements
final widget = finder.firstWidget;
final allWidgets = finder.allWidgets;
final element = finder.firstElement;
final allElements = finder.allElements;
```

## Example Test

Here's a complete example of how to use `flutter_test_helpers` in your tests:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_helpers/flutter_test_helpers.dart';

void main() {
  group('MyWidget Tests', () {
    testWidgets('should display and handle interactions', (WidgetTester tester) async {
      // Create test app with helpers
      final app = TestUtilities.createTestApp(
        WidgetTestingHelpers.createPaddedWidget(
          MyWidget(
            title: MockDataGenerators.randomString(10),
            color: MockDataGenerators.randomColor(),
          ),
        ),
      );

      await tester.pumpWidget(app);

      // Use helper methods to find and interact
      final titleFinder = TestUtilities.findByText('My Widget');
      expect(titleFinder, findsOneWidget);

      // Use extensions for easier interaction
      await tester.tapByKey(Key('action-button'));
      await tester.pumpAndSettle();

      // Wait for state changes
      await tester.waitForWidget(find.byType(SuccessWidget));
    });
  });
}
```

## Platform Support

This package supports all Flutter platforms:

- ✅ **iOS** - Full support
- ✅ **Android** - Full support  
- ✅ **Web** - Full support
- ✅ **Windows** - Full support
- ✅ **macOS** - Full support
- ✅ **Linux** - Full support
- ✅ **WASM** - Compatible with Flutter WebAssembly

## Requirements

- **Flutter**: >=3.32.0
- **Dart**: >=3.8.0
- **Flutter Test**: Included in Flutter SDK

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Dhia Bechattaoui**

- GitHub: [@Dhia-Bechattaoui](https://github.com/Dhia-Bechattaoui)

## Support

If you encounter any issues or have questions, please:

1. Check the [documentation](https://pub.dev/packages/flutter_test_helpers)
2. Search [existing issues](https://github.com/Dhia-Bechattaoui/flutter_test_helpers/issues)
3. Create a [new issue](https://github.com/Dhia-Bechattaoui/flutter_test_helpers/issues/new)

---

**Made with ❤️ for the Flutter community**
