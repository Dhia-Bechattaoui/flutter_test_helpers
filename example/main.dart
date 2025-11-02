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
