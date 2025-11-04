import 'package:flutter/material.dart';
import 'package:flutter_test_helpers/flutter_test_helpers.dart';

void main() {
  runApp(const FlutterTestHelpersExampleApp());
}

class FlutterTestHelpersExampleApp extends StatelessWidget {
  const FlutterTestHelpersExampleApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Test Helpers Example',
    theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    home: const ExampleHomePage(),
  );
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color accentColor = MockDataGenerators.randomColor();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test Helpers'),
        backgroundColor: accentColor,
        foregroundColor: accentColor.contrastColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCategoryCard(
            context,
            'Mock Data Generators',
            'Generate random data for testing',
            '🎲',
            accentColor,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MockDataGeneratorsPage(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryCard(
            context,
            'Color Extensions',
            'Color manipulation utilities',
            '🎨',
            accentColor,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ColorExtensionsPage(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryCard(
            context,
            'String Extensions',
            'String utility methods',
            '📝',
            accentColor,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StringExtensionsPage(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryCard(
            context,
            'DateTime Extensions',
            'Date and time utilities',
            '📅',
            accentColor,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DateTimeExtensionsPage(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryCard(
            context,
            'List Extensions',
            'List utility methods',
            '📋',
            accentColor,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListExtensionsPage(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryCard(
            context,
            'Test Utilities & Helpers',
            'Testing utilities and examples',
            '🧪',
            accentColor,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestUtilitiesPage(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryCard(
            context,
            'Platform Support',
            'Supported platforms',
            '💻',
            accentColor,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlatformSupportPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    String emoji,
    Color color,
    VoidCallback onTap,
  ) => Card(
    elevation: 2,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 28)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Text('›', style: TextStyle(fontSize: 24, color: Colors.grey)),
          ],
        ),
      ),
    ),
  );
}

class MockDataGeneratorsPage extends StatefulWidget {
  const MockDataGeneratorsPage({super.key});

  @override
  State<MockDataGeneratorsPage> createState() => _MockDataGeneratorsPageState();
}

class _MockDataGeneratorsPageState extends State<MockDataGeneratorsPage> {
  Color _currentColor = Colors.blue;
  String _currentString = '';
  int _currentInt = 0;
  double _currentDouble = 0.0;
  bool _currentBool = false;
  DateTime _currentDate = DateTime.now();
  List<String> _currentStringList = <String>[];
  List<int> _currentIntList = <int>[];
  List<Color> _currentColorList = <Color>[];

  @override
  void initState() {
    super.initState();
    _generateAllData();
  }

  void _generateAllData() {
    setState(() {
      _currentColor = MockDataGenerators.randomColor();
      _currentString = MockDataGenerators.randomString(15);
      _currentInt = MockDataGenerators.randomInt(1, 100);
      _currentDouble = MockDataGenerators.randomDouble(0.0, 1.0);
      _currentBool = MockDataGenerators.randomBool();
      _currentDate = MockDataGenerators.randomDate();
      _currentStringList = MockDataGenerators.randomStringList(5);
      _currentIntList = MockDataGenerators.randomIntList(5);
      _currentColorList = MockDataGenerators.randomColorList(5);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Text('←', style: TextStyle(fontSize: 24)),
        onPressed: () => Navigator.of(context).pop(),
        color: _currentColor.contrastColor,
      ),
      title: const Text('Mock Data Generators'),
      backgroundColor: _currentColor,
      foregroundColor: _currentColor.contrastColor,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDataCard(
            'Random Color',
            _currentColor.toString(),
            _currentColor,
          ),
          _buildDataCard('Random String', _currentString, null),
          _buildDataCard('Random Integer', _currentInt.toString(), null),
          _buildDataCard(
            'Random Double',
            _currentDouble.toStringAsFixed(4),
            null,
          ),
          _buildDataCard('Random Boolean', _currentBool.toString(), null),
          _buildDataCard(
            'Random Date',
            _currentDate.toString().split(' ')[0],
            null,
          ),
          _buildDataCard(
            'Random String List',
            _currentStringList.join(', '),
            null,
          ),
          _buildDataCard('Random Int List', _currentIntList.join(', '), null),
          _buildDataCard(
            'Random Color List',
            _currentColorList.map((c) => c.toHex()).join(', '),
            null,
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: _generateAllData,
              style: ElevatedButton.styleFrom(
                backgroundColor: _currentColor,
                foregroundColor: _currentColor.contrastColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Generate New Data',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildDataCard(String label, String value, Color? color) => Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (color != null)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
            ),
          if (color != null) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontFamily: 'monospace'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class ColorExtensionsPage extends StatefulWidget {
  const ColorExtensionsPage({super.key});

  @override
  State<ColorExtensionsPage> createState() => _ColorExtensionsPageState();
}

class _ColorExtensionsPageState extends State<ColorExtensionsPage> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = MockDataGenerators.randomColor();
  }

  void _generateNewColor() {
    setState(() {
      _currentColor = MockDataGenerators.randomColor();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Text('←', style: TextStyle(fontSize: 24)),
        onPressed: () => Navigator.of(context).pop(),
        color: _currentColor.contrastColor,
      ),
      title: const Text('Color Extensions'),
      backgroundColor: _currentColor,
      foregroundColor: _currentColor.contrastColor,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDataCard(
            'Original Color',
            _currentColor.toString(),
            _currentColor,
          ),
          _buildDataCard(
            'Lightened (0.2)',
            _currentColor.lighten(0.2).toString(),
            _currentColor.lighten(0.2),
          ),
          _buildDataCard(
            'Darkened (0.2)',
            _currentColor.darken(0.2).toString(),
            _currentColor.darken(0.2),
          ),
          _buildDataCard(
            'Saturated (0.2)',
            _currentColor.saturate(0.2).toString(),
            _currentColor.saturate(0.2),
          ),
          _buildDataCard(
            'Desaturated (0.2)',
            _currentColor.desaturate(0.2).toString(),
            _currentColor.desaturate(0.2),
          ),
          _buildDataCard(
            'Contrast Color',
            _currentColor.contrastColor.toString(),
            _currentColor.contrastColor,
          ),
          _buildDataCard('Hex String', _currentColor.toHex(), null),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: _generateNewColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: _currentColor,
                foregroundColor: _currentColor.contrastColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Generate New Color',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildDataCard(String label, String value, Color? color) => Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (color != null)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
            ),
          if (color != null) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontFamily: 'monospace'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class StringExtensionsPage extends StatefulWidget {
  const StringExtensionsPage({super.key});

  @override
  State<StringExtensionsPage> createState() => _StringExtensionsPageState();
}

class _StringExtensionsPageState extends State<StringExtensionsPage> {
  late String _currentString;

  @override
  void initState() {
    super.initState();
    _currentString = MockDataGenerators.randomString(15);
  }

  void _generateNewString() {
    setState(() {
      _currentString = MockDataGenerators.randomString(15);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color accentColor = MockDataGenerators.randomColor();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('←', style: TextStyle(fontSize: 24)),
          onPressed: () => Navigator.of(context).pop(),
          color: accentColor.contrastColor,
        ),
        title: const Text('String Extensions'),
        backgroundColor: accentColor,
        foregroundColor: accentColor.contrastColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataCard('Original String', _currentString, null),
            _buildDataCard('Capitalized', _currentString.capitalize, null),
            _buildDataCard('Title Case', _currentString.titleCase, null),
            _buildDataCard('Truncated (10)', _currentString.truncate(10), null),
            _buildDataCard(
              'Is Email',
              'test@example.com'.isEmail.toString(),
              null,
            ),
            _buildDataCard(
              'Is URL',
              'https://example.com'.isUrl.toString(),
              null,
            ),
            _buildDataCard(
              'Remove Whitespace',
              '  hello  world  '.removeWhitespace,
              null,
            ),
            _buildDataCard('Reversed', 'hello'.reversed, null),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _generateNewString,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: accentColor.contrastColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Generate New String',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard(String label, String value, Color? color) => Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (color != null)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
            ),
          if (color != null) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontFamily: 'monospace'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class DateTimeExtensionsPage extends StatefulWidget {
  const DateTimeExtensionsPage({super.key});

  @override
  State<DateTimeExtensionsPage> createState() => _DateTimeExtensionsPageState();
}

class _DateTimeExtensionsPageState extends State<DateTimeExtensionsPage> {
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = MockDataGenerators.randomDate();
  }

  void _generateNewDate() {
    setState(() {
      _currentDate = MockDataGenerators.randomDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color accentColor = MockDataGenerators.randomColor();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('←', style: TextStyle(fontSize: 24)),
          onPressed: () => Navigator.of(context).pop(),
          color: accentColor.contrastColor,
        ),
        title: const Text('DateTime Extensions'),
        backgroundColor: accentColor,
        foregroundColor: accentColor.contrastColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataCard(
              'Current Date',
              _currentDate.toString().split(' ')[0],
              null,
            ),
            _buildDataCard('Is Today', _currentDate.isToday.toString(), null),
            _buildDataCard(
              'Start of Day',
              _currentDate.startOfDay.toString().split(' ')[1],
              null,
            ),
            _buildDataCard(
              'End of Day',
              _currentDate.endOfDay.toString().split(' ')[1],
              null,
            ),
            _buildDataCard(
              'Start of Week',
              _currentDate.startOfWeek.toString().split(' ')[0],
              null,
            ),
            _buildDataCard(
              'End of Week',
              _currentDate.endOfWeek.toString().split(' ')[0],
              null,
            ),
            _buildDataCard(
              'Start of Month',
              _currentDate.startOfMonth.toString().split(' ')[0],
              null,
            ),
            _buildDataCard(
              'End of Month',
              _currentDate.endOfMonth.toString().split(' ')[0],
              null,
            ),
            _buildDataCard(
              'Start of Year',
              _currentDate.startOfYear.toString().split(' ')[0],
              null,
            ),
            _buildDataCard(
              'End of Year',
              _currentDate.endOfYear.toString().split(' ')[0],
              null,
            ),
            _buildDataCard('Relative Time', _currentDate.relativeTime, null),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _generateNewDate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: accentColor.contrastColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Generate New Date',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard(String label, String value, Color? color) => Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (color != null)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
            ),
          if (color != null) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontFamily: 'monospace'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class ListExtensionsPage extends StatefulWidget {
  const ListExtensionsPage({super.key});

  @override
  State<ListExtensionsPage> createState() => _ListExtensionsPageState();
}

class _ListExtensionsPageState extends State<ListExtensionsPage> {
  late List<int> _currentIntList;

  @override
  void initState() {
    super.initState();
    _currentIntList = MockDataGenerators.randomIntList(5);
  }

  void _generateNewList() {
    setState(() {
      _currentIntList = MockDataGenerators.randomIntList(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color accentColor = MockDataGenerators.randomColor();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('←', style: TextStyle(fontSize: 24)),
          onPressed: () => Navigator.of(context).pop(),
          color: accentColor.contrastColor,
        ),
        title: const Text('List Extensions'),
        backgroundColor: accentColor,
        foregroundColor: accentColor.contrastColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataCard('Original List', _currentIntList.join(', '), null),
            _buildDataCard(
              'Random Element',
              _currentIntList.random?.toString() ?? 'null',
              null,
            ),
            _buildDataCard(
              'Shuffled',
              _currentIntList.shuffled.join(', '),
              null,
            ),
            _buildDataCard(
              'First or Null',
              _currentIntList.firstOrNull?.toString() ?? 'null',
              null,
            ),
            _buildDataCard(
              'Last or Null',
              _currentIntList.lastOrNull?.toString() ?? 'null',
              null,
            ),
            _buildDataCard(
              'Even Indices',
              _currentIntList.evenIndices.join(', '),
              null,
            ),
            _buildDataCard(
              'Odd Indices',
              _currentIntList.oddIndices.join(', '),
              null,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _generateNewList,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: accentColor.contrastColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Generate New List',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard(String label, String value, Color? color) => Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (color != null)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
            ),
          if (color != null) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontFamily: 'monospace'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class TestUtilitiesPage extends StatefulWidget {
  const TestUtilitiesPage({super.key});

  @override
  State<TestUtilitiesPage> createState() => _TestUtilitiesPageState();
}

class _TestUtilitiesPageState extends State<TestUtilitiesPage> {
  String _inputText = '';
  String _inputTextByType = '';
  bool _buttonTapped = false;
  int _tapCount = 0;
  bool _tapByTextWorked = false;
  bool _tapByTypeWorked = false;
  bool _showDelayedWidget = false;
  bool _showDisappearWidget = true;
  final List<String> _scrollableItems = List.generate(
    20,
    (i) => 'Item ${i + 1}',
  );
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color accentColor = MockDataGenerators.randomColor();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('←', style: TextStyle(fontSize: 24)),
          onPressed: () => Navigator.of(context).pop(),
          color: accentColor.contrastColor,
        ),
        title: const Text('Test Utilities & Helpers'),
        backgroundColor: accentColor,
        foregroundColor: accentColor.contrastColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              'TestUtilities.createTestApp()',
              'Creates a MaterialApp wrapper for testing',
              Icons.apps,
            ),
            _buildInfoCard(
              'TestUtilities.findByKey()',
              'Finds widgets by their key',
              Icons.search,
            ),
            _buildInfoCard(
              'tester.tapByKey()',
              'Taps widgets by key using WidgetTester extension',
              Icons.touch_app,
            ),
            _buildInfoCard(
              'tester.enterTextByKey()',
              'Enters text into fields by key',
              Icons.keyboard,
            ),
            _buildInfoCard(
              'tester.tapByText()',
              'Taps widgets by their text content',
              Icons.text_fields,
            ),
            _buildInfoCard(
              'tester.tapByType()',
              'Taps widgets by their type',
              Icons.category,
            ),
            _buildInfoCard(
              'tester.scrollToKey()',
              'Scrolls to a widget by key',
              Icons.swap_vert,
            ),
            _buildInfoCard(
              'tester.waitForWidget()',
              'Waits for widget to appear',
              Icons.schedule,
            ),
            _buildInfoCard(
              'Finder extensions',
              'hasOne, hasMultiple, firstWidget, allWidgets',
              Icons.extension,
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Interactive Demo:',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'This widget was created using TestUtilities.createTestApp()',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            // Interactive Demo Section
            _buildSectionTitle(
              '1. TestUtilities.findByKey() & tester.tapByKey()',
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Button (Key: demo-button)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      key: const Key('demo-button'),
                      onPressed: () {
                        setState(() {
                          _buttonTapped = true;
                          _tapCount++;
                        });
                      },
                      child: Text('Tap Me (Count: $_tapCount)'),
                    ),
                    if (_buttonTapped)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Button tapped $_tapCount time(s)!',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(
              '2. tester.enterTextByKey() & tester.enterTextByType()',
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TextField (Key: demo-input)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      key: const Key('demo-input'),
                      decoration: const InputDecoration(
                        labelText:
                            'Test with enterTextByKey('
                            'Key(\'demo-input\'), \'text\')',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _inputText = value;
                        });
                      },
                    ),
                    if (_inputText.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.green[300]!),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Field Value: "$_inputText"',
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    const Text(
                      'TextField (No Key - Test with '
                      'enterTextByType<TextField>())',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: const InputDecoration(
                        labelText:
                            'Test with enterTextByType<TextField>(\'text\')',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _inputTextByType = value;
                        });
                      },
                    ),
                    if (_inputTextByType.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.green[300]!),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Field Value: "$_inputTextByType"',
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('3. tester.tapByText()'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Button with text "Tap By Text"',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tapByTextWorked = true;
                        });
                      },
                      child: const Text('Tap By Text'),
                    ),
                    if (_tapByTextWorked)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'tapByText() worked!',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('4. tester.tapByType<T>()'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Multiple IconButtons (Test with '
                      'tapByType<IconButton>())',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          color: _tapByTypeWorked ? Colors.red : Colors.grey,
                          onPressed: () {
                            setState(() {
                              _tapByTypeWorked = true;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.star),
                          color: _tapByTypeWorked ? Colors.amber : Colors.grey,
                          onPressed: () {
                            setState(() {
                              _tapByTypeWorked = true;
                            });
                          },
                        ),
                        const Text('(Any IconButton can be tapped)'),
                      ],
                    ),
                    if (_tapByTypeWorked)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'tapByType<IconButton>() worked!',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(
              '5. tester.scrollToKey() & tester.scrollToText()',
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Scrollable List - Testing Scroll Functionality',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      color: Colors.blue[50],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Try it yourself:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Scroll to item 15 (index 14)
                                // Calculate position: each dense ListTile is
                                // ~56px. Item 15 is at index 14, so position =
                                // 14 * 56 = 784px
                                if (_scrollController.hasClients) {
                                  const targetPosition = 14.0 * 56.0;
                                  _scrollController.animateTo(
                                    targetPosition.clamp(
                                      0.0,
                                      _scrollController
                                          .position
                                          .maxScrollExtent,
                                    ),
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              icon: const Icon(Icons.arrow_downward),
                              label: const Text('Scroll to Item 15'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Press the button above to see automatic '
                              'scrolling in action!',
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Scrollable List (20 items - exactly 5-6 visible '
                      'at once)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      // Increased height to show 5-6 items (ListTile ~56px)
                      height: 360,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _scrollableItems.length,
                        itemBuilder: (context, index) => ListTile(
                          key: Key('list-item-$index'),
                          dense: true, // Makes items more compact
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          leading: CircleAvatar(
                            radius: 18,
                            backgroundColor: index == 14
                                ? Colors.red[100]
                                : Colors.grey[300],
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: index == 14
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          title: Text(
                            _scrollableItems[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: index == 14
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          subtitle: Text(
                            'Key: list-item-$index',
                            style: const TextStyle(fontSize: 10),
                          ),
                          trailing: index == 14
                              ? const Icon(
                                  Icons.flag,
                                  color: Colors.red,
                                  size: 20,
                                )
                              : const Icon(Icons.arrow_forward, size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.flag, color: Colors.red, size: 16),
                              SizedBox(width: 4),
                              Text(
                                'Target Item 15 (Key: list-item-14)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Item 15 is initially OFF-SCREEN '
                            '(below visible area)\n'
                            'Press the "Scroll to Item 15" button above to '
                            'see it scroll automatically!',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('6. Finder Extensions - hasOne, hasMultiple'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Single Widget (Test hasOne)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Unique Text',
                      key: Key('unique-text'),
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Multiple Widgets (Test hasMultiple)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        5,
                        (index) => Chip(
                          key: Key('chip-$index'),
                          label: const Text('Multiple Chip'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'find.text(\'Multiple Chip\').hasMultiple = true '
                      '(finds 5 chips)',
                      style: TextStyle(color: Colors.grey[600], fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('7. tester.waitForWidget()'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delayed Widget Appearance',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 1), () {
                          if (mounted) {
                            setState(() {
                              _showDelayedWidget = true;
                            });
                          }
                        });
                      },
                      child: const Text('Show Delayed Widget'),
                    ),
                    const SizedBox(height: 8),
                    if (!_showDelayedWidget)
                      const Center(child: CircularProgressIndicator()),
                    if (_showDelayedWidget)
                      Card(
                        color: Colors.green[50],
                        key: const Key('delayed-widget'),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Widget appeared! (Key: delayed-widget)'),
                        ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      'Test: tester.waitForWidget('
                      'find.byKey(Key(\'delayed-widget\')))',
                      style: TextStyle(color: Colors.grey[600], fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('8. tester.waitForWidgetToDisappear()'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Disappearing Widget',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showDisappearWidget = false;
                        });
                      },
                      child: const Text('Hide Widget'),
                    ),
                    const SizedBox(height: 8),
                    if (_showDisappearWidget)
                      Card(
                        color: Colors.orange[50],
                        key: const Key('disappear-widget'),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'This widget will disappear '
                            '(Key: disappear-widget)',
                          ),
                        ),
                      ),
                    if (!_showDisappearWidget)
                      const Text(
                        'Widget disappeared!',
                        style: TextStyle(color: Colors.green),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      'Test: tester.waitForWidgetToDisappear('
                      'find.byKey(Key(\'disappear-widget\')))',
                      style: TextStyle(color: Colors.grey[600], fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📝 Complete Testing Guide:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTestInstruction(
                      '1',
                      'findByKey: TestUtilities.findByKey('
                          'Key(\'demo-button\'))',
                    ),
                    _buildTestInstruction(
                      '2',
                      'tapByKey: tester.tapByKey(Key(\'demo-button\'))',
                    ),
                    _buildTestInstruction(
                      '3',
                      'enterTextByKey: tester.enterTextByKey('
                          'Key(\'demo-input\'), \'Hello\')',
                    ),
                    _buildTestInstruction(
                      '4',
                      'tapByText: tester.tapByText(\'Tap By Text\')',
                    ),
                    _buildTestInstruction(
                      '5',
                      'tapByType: tester.tapByType<IconButton>()',
                    ),
                    _buildTestInstruction(
                      '6',
                      'scrollToKey: tester.scrollToKey(Key(\'list-item-14\'))',
                    ),
                    _buildTestInstruction(
                      '7',
                      'hasOne: finder.hasOne (returns bool)',
                    ),
                    _buildTestInstruction(
                      '8',
                      'hasMultiple: finder.hasMultiple (returns bool)',
                    ),
                    _buildTestInstruction(
                      '9',
                      'waitForWidget: tester.waitForWidget(finder)',
                    ),
                    _buildTestInstruction(
                      '10',
                      'See test_example_test.dart for complete examples!',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String description, IconData icon) =>
      Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildSectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.blue[700],
      ),
    ),
  );

  Widget _buildTestInstruction(String number, String instruction) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(instruction, style: const TextStyle(fontSize: 12)),
        ),
      ],
    ),
  );
}

class PlatformSupportPage extends StatelessWidget {
  const PlatformSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color accentColor = MockDataGenerators.randomColor();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('←', style: TextStyle(fontSize: 24)),
          onPressed: () => Navigator.of(context).pop(),
          color: accentColor.contrastColor,
        ),
        title: const Text('Platform Support'),
        backgroundColor: accentColor,
        foregroundColor: accentColor.contrastColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataCard('iOS', '✅ Supported', null),
            _buildDataCard('Android', '✅ Supported', null),
            _buildDataCard('Web', '✅ Supported', null),
            _buildDataCard('Windows', '✅ Supported', null),
            _buildDataCard('macOS', '✅ Supported', null),
            _buildDataCard('Linux', '✅ Supported', null),
            _buildDataCard('WASM', '✅ Compatible', null),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'This package demonstrates cross-platform '
                'compatibility\nand WASM support of flutter_test_helpers',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard(String label, String value, Color? color) => Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (color != null)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
            ),
          if (color != null) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
