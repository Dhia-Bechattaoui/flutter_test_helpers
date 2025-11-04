import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_helpers/flutter_test_helpers.dart';

void main() {
  group('TestUtilities Examples', () {
    testWidgets('createTestApp creates a test app', (
      WidgetTester tester,
    ) async {
      // Example: Create a test app using TestUtilities
      final app = TestUtilities.createTestApp(
        const Center(child: Text('Hello Test')),
      );

      await tester.pumpWidget(app);

      // Verify the widget is displayed
      expect(find.text('Hello Test'), findsOneWidget);
    });

    testWidgets('createTestAppWithTheme creates themed app', (
      WidgetTester tester,
    ) async {
      // Example: Create a test app with custom theme
      final theme = ThemeData(primarySwatch: Colors.blue, useMaterial3: true);

      final app = TestUtilities.createTestAppWithTheme(
        const Center(child: Text('Themed App')),
        theme,
      );

      await tester.pumpWidget(app);
      expect(find.text('Themed App'), findsOneWidget);
    });

    testWidgets('findByKey finds widget by key', (WidgetTester tester) async {
      const testKey = Key('test-button');

      await tester.pumpWidget(
        TestUtilities.createTestApp(
          ElevatedButton(
            key: testKey,
            onPressed: () {},
            child: const Text('Test Button'),
          ),
        ),
      );

      final finder = TestUtilities.findByKey(testKey);
      expect(finder, findsOneWidget);
    });

    testWidgets('findByText finds widget by text', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestUtilities.createTestApp(const Center(child: Text('Find Me'))),
      );

      final finder = TestUtilities.findByText('Find Me');
      expect(finder, findsOneWidget);
    });

    testWidgets('tap method taps a widget', (WidgetTester tester) async {
      bool tapped = false;
      const testKey = Key('tap-button');

      await tester.pumpWidget(
        TestUtilities.createTestApp(
          ElevatedButton(
            key: testKey,
            onPressed: () => tapped = true,
            child: const Text('Tap Me'),
          ),
        ),
      );

      await TestUtilities.tap(tester, TestUtilities.findByKey(testKey));
      expect(tapped, isTrue);
    });

    testWidgets('enterText enters text into field', (
      WidgetTester tester,
    ) async {
      const testKey = Key('text-field');

      await tester.pumpWidget(
        TestUtilities.createTestApp(const TextField(key: testKey)),
      );

      await TestUtilities.enterText(
        tester,
        TestUtilities.findByKey(testKey),
        'Hello World',
      );

      final textField = tester.widget<TextField>(
        TestUtilities.findByKey(testKey),
      );
      expect(textField.controller?.text, 'Hello World');
    });
  });

  group('WidgetTester Extensions Examples', () {
    testWidgets('tapByKey taps widget by key', (WidgetTester tester) async {
      bool tapped = false;
      const testKey = Key('tap-key');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ElevatedButton(
              key: testKey,
              onPressed: () => tapped = true,
              child: const Text('Tap'),
            ),
          ),
        ),
      );

      await tester.tapByKey(testKey);
      expect(tapped, isTrue);
    });

    testWidgets('tapByText taps widget by text', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ElevatedButton(
              onPressed: () => tapped = true,
              child: const Text('Tap Me'),
            ),
          ),
        ),
      );

      await tester.tapByText('Tap Me');
      expect(tapped, isTrue);
    });

    testWidgets('tapByType taps widget by type', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ElevatedButton(
              onPressed: () => tapped = true,
              child: const Text('Tap'),
            ),
          ),
        ),
      );

      await tester.tapByType<ElevatedButton>();
      expect(tapped, isTrue);
    });

    testWidgets('enterTextByKey enters text by key', (
      WidgetTester tester,
    ) async {
      const testKey = Key('input-field');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextField(key: testKey)),
        ),
      );

      await tester.enterTextByKey(testKey, 'Test Input');
      await tester.pump();

      final textField = tester.widget<TextField>(find.byKey(testKey));
      expect(textField.controller?.text, 'Test Input');
    });

    testWidgets('enterTextByType enters text by type', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: TextField())),
      );

      await tester.enterTextByType<TextField>('Type Test');
      await tester.pump();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.controller?.text, 'Type Test');
    });

    testWidgets('scrollToKey scrolls to widget', (WidgetTester tester) async {
      const testKey = Key('scroll-target');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: List.generate(
                50,
                (index) => SizedBox(
                  height: 100,
                  child: index == 49
                      ? const Center(key: testKey, child: Text('Target'))
                      : Center(child: Text('Item $index')),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.scrollToKey(testKey);
      await tester.pumpAndSettle();

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('scrollToKey - Example: Test scrollable list in demo page', (
      WidgetTester tester,
    ) async {
      // This is how you would test the scrollable list in section 5 of the demo
      final scrollableItems = List.generate(20, (i) => 'Item ${i + 1}');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 360, // Matches demo: shows exactly 5-6 items visible
              child: ListView.builder(
                itemCount: scrollableItems.length,
                itemBuilder: (context, index) => ListTile(
                  key: Key('list-item-$index'),
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  title: Text(scrollableItems[index]),
                ),
              ),
            ),
          ),
        ),
      );

      // Item 15 is initially off-screen (exactly 5-6 items visible at once)
      // Use scrollToKey to scroll until item 15 (index 14) is visible
      const item15Key = Key('list-item-14');

      // Before scrolling, item 15 might not be visible
      // Scroll to make it visible
      await tester.scrollToKey(item15Key);
      await tester.pumpAndSettle();

      // Now item 15 should be visible and we can interact with it
      expect(find.byKey(item15Key), findsOneWidget);

      // You can now tap it or test other interactions
      await tester.tap(find.byKey(item15Key));
      await tester.pumpAndSettle();
    });

    testWidgets('scrollToText - Example: Scroll to widget by text content', (
      WidgetTester tester,
    ) async {
      final scrollableItems = List.generate(20, (i) => 'Item ${i + 1}');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 360, // Matches demo: shows exactly 5-6 items visible
              child: ListView.builder(
                itemCount: scrollableItems.length,
                itemBuilder: (context, index) => ListTile(
                  key: Key('list-item-$index'),
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  title: Text(scrollableItems[index]),
                ),
              ),
            ),
          ),
        ),
      );

      // Scroll to item 15 by its text content instead of key
      await tester.scrollToText('Item 15');
      await tester.pumpAndSettle();

      // Verify item 15 is now visible
      expect(find.text('Item 15'), findsOneWidget);
      expect(find.byKey(const Key('list-item-14')), findsOneWidget);
    });

    testWidgets('waitForWidget waits for widget', (WidgetTester tester) async {
      const testKey = Key('delayed-widget');

      // Start with loading indicator
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: CircularProgressIndicator())),
        ),
      );

      // Start waiting in background
      final waitFuture = tester.waitForWidget(find.byKey(testKey));

      // Simulate delayed appearance
      await Future.delayed(const Duration(milliseconds: 100));
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(key: testKey, child: Text('Delayed')),
          ),
        ),
      );

      await waitFuture;
      expect(find.byKey(testKey), findsOneWidget);
    });
  });

  group('Finder Extensions Examples', () {
    testWidgets('hasOne checks if exactly one widget found', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: Text('Unique'))),
        ),
      );

      final finder = find.text('Unique');
      expect(finder.hasOne, isTrue);
      expect(finder.hasMultiple, isFalse);
    });

    testWidgets('hasMultiple checks if multiple widgets found', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Duplicate'),
                Text('Duplicate'),
                Text('Duplicate'),
              ],
            ),
          ),
        ),
      );

      final finder = find.text('Duplicate');
      expect(finder.hasOne, isFalse);
      expect(finder.hasMultiple, isTrue);
    });

    testWidgets('firstWidget gets first widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: Text('Test'))),
        ),
      );

      final finder = find.text('Test');
      final widget = finder.firstWidget;

      expect(widget, isNotNull);
      expect(widget, isA<Text>());
    });

    testWidgets('allWidgets gets all widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [Text('First'), Text('Second'), Text('Third')],
            ),
          ),
        ),
      );

      final finder = find.byType(Text);
      final widgets = finder.allWidgets;

      expect(widgets.length, equals(3));
      expect(widgets.every((w) => w is Text), isTrue);
    });

    testWidgets('firstElement gets first element', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: Text('Test'))),
        ),
      );

      final finder = find.text('Test');
      final element = finder.firstElement;

      expect(element, isNotNull);
      expect(element?.widget, isA<Text>());
    });

    testWidgets('allElements gets all elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(children: [Text('Item 1'), Text('Item 2')]),
          ),
        ),
      );

      final finder = find.byType(Text);
      final elements = finder.allElements;

      expect(elements.length, equals(2));
    });
  });

  group('Integration Example', () {
    testWidgets('Complete test using all features', (
      WidgetTester tester,
    ) async {
      // Create test app with TestUtilities
      final app = TestUtilities.createTestApp(
        WidgetTestingHelpers.createPaddedWidget(
          Column(
            children: [
              Text(
                MockDataGenerators.randomString(10),
                key: const Key('title'),
              ),
              ElevatedButton(
                key: const Key('action-button'),
                onPressed: () {},
                child: const Text('Click Me'),
              ),
              const TextField(
                key: Key('input-field'),
                decoration: InputDecoration(hintText: 'Enter text'),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(app);

      // Use TestUtilities to find widgets
      final titleFinder = TestUtilities.findByText('Click Me');
      expect(titleFinder, findsOneWidget);

      // Use WidgetTester extensions
      await tester.tapByKey(const Key('action-button'));
      await tester.pumpAndSettle();

      // Use Finder extensions
      final buttonFinder = TestUtilities.findByKey(const Key('action-button'));
      expect(buttonFinder.hasOne, isTrue);
      expect(buttonFinder.firstWidget, isNotNull);

      // Enter text using extension
      await tester.enterTextByKey(const Key('input-field'), 'Test Input');
      await tester.pump();

      // Verify with Finder extensions
      final inputFinder = TestUtilities.findByKey(const Key('input-field'));
      final textField = inputFinder.firstWidget as TextField;
      expect(textField.controller?.text, 'Test Input');
    });
  });
}
