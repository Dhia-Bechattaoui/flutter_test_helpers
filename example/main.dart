import 'package:flutter/material.dart';
import 'package:flutter_test_helpers/flutter_test_helpers.dart';

void main() {
  runApp(const FlutterTestHelpersExampleApp());
}

class FlutterTestHelpersExampleApp extends StatelessWidget {
  const FlutterTestHelpersExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Helpers Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test Helpers Example'),
        backgroundColor: _currentColor,
        foregroundColor: _currentColor.contrastColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Mock Data Generators',
              [
                _buildDataCard(
                    'Random Color', _currentColor.toString(), _currentColor),
                _buildDataCard('Random String', _currentString, null),
                _buildDataCard('Random Integer', _currentInt.toString(), null),
                _buildDataCard(
                    'Random Double', _currentDouble.toStringAsFixed(4), null),
                _buildDataCard('Random Boolean', _currentBool.toString(), null),
                _buildDataCard(
                    'Random Date', _currentDate.toString().split(' ')[0], null),
                _buildDataCard(
                    'Random String List', _currentStringList.join(', '), null),
                _buildDataCard(
                    'Random Int List', _currentIntList.join(', '), null),
                _buildDataCard('Random Color List',
                    '${_currentColorList.length} colors', null),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Color Extensions',
              [
                _buildDataCard(
                    'Original Color', _currentColor.toString(), _currentColor),
                _buildDataCard(
                    'Lightened (0.2)',
                    _currentColor.lighten(0.2).toString(),
                    _currentColor.lighten(0.2)),
                _buildDataCard(
                    'Darkened (0.2)',
                    _currentColor.darken(0.2).toString(),
                    _currentColor.darken(0.2)),
                _buildDataCard(
                    'Saturated (0.2)',
                    _currentColor.saturate(0.2).toString(),
                    _currentColor.saturate(0.2)),
                _buildDataCard(
                    'Desaturated (0.2)',
                    _currentColor.desaturate(0.2).toString(),
                    _currentColor.desaturate(0.2)),
                _buildDataCard(
                    'Contrast Color',
                    _currentColor.contrastColor.toString(),
                    _currentColor.contrastColor),
                _buildDataCard('Hex String', _currentColor.toHex(), null),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'String Extensions',
              [
                _buildDataCard('Original String', _currentString, null),
                _buildDataCard('Capitalized', _currentString.capitalize, null),
                _buildDataCard('Title Case', _currentString.titleCase, null),
                _buildDataCard(
                    'Truncated (10)', _currentString.truncate(10), null),
                _buildDataCard(
                    'Is Email', 'test@example.com'.isEmail.toString(), null),
                _buildDataCard(
                    'Is URL', 'https://example.com'.isUrl.toString(), null),
                _buildDataCard('Remove Whitespace',
                    '  hello  world  '.removeWhitespace, null),
                _buildDataCard('Reversed', 'hello'.reversed, null),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'DateTime Extensions',
              [
                _buildDataCard('Current Date',
                    _currentDate.toString().split(' ')[0], null),
                _buildDataCard(
                    'Is Today', _currentDate.isToday.toString(), null),
                _buildDataCard('Start of Day',
                    _currentDate.startOfDay.toString().split(' ')[1], null),
                _buildDataCard('End of Day',
                    _currentDate.endOfDay.toString().split(' ')[1], null),
                _buildDataCard('Start of Week',
                    _currentDate.startOfWeek.toString().split(' ')[0], null),
                _buildDataCard('End of Week',
                    _currentDate.endOfWeek.toString().split(' ')[0], null),
                _buildDataCard('Start of Month',
                    _currentDate.startOfMonth.toString().split(' ')[0], null),
                _buildDataCard('End of Month',
                    _currentDate.endOfMonth.toString().split(' ')[0], null),
                _buildDataCard('Start of Year',
                    _currentDate.startOfYear.toString().split(' ')[0], null),
                _buildDataCard('End of Year',
                    _currentDate.endOfYear.toString().split(' ')[0], null),
                _buildDataCard(
                    'Relative Time', _currentDate.relativeTime, null),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'List Extensions',
              [
                _buildDataCard(
                    'Original List', _currentIntList.join(', '), null),
                _buildDataCard('Random Element',
                    _currentIntList.random?.toString() ?? 'null', null),
                _buildDataCard(
                    'Shuffled', _currentIntList.shuffled.join(', '), null),
                _buildDataCard('First or Null',
                    _currentIntList.firstOrNull?.toString() ?? 'null', null),
                _buildDataCard('Last or Null',
                    _currentIntList.lastOrNull?.toString() ?? 'null', null),
                _buildDataCard('Even Indices',
                    _currentIntList.evenIndices.join(', '), null),
                _buildDataCard(
                    'Odd Indices', _currentIntList.oddIndices.join(', '), null),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Platform Support',
              [
                _buildDataCard('iOS', '✅ Supported', null),
                _buildDataCard('Android', '✅ Supported', null),
                _buildDataCard('Web', '✅ Supported', null),
                _buildDataCard('Windows', '✅ Supported', null),
                _buildDataCard('macOS', '✅ Supported', null),
                _buildDataCard('Linux', '✅ Supported', null),
                _buildDataCard('WASM', '✅ Compatible', null),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _generateAllData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentColor,
                  foregroundColor: _currentColor.contrastColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Generate New Data',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'This example demonstrates the cross-platform compatibility\nand WASM support of flutter_test_helpers',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: _currentColor,
              ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildDataCard(String label, String value, Color? color) {
    return Card(
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontFamily: 'monospace',
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
