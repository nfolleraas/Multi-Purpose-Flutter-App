import 'package:flutter/material.dart';
import 'package:multi_purpose_flutter_app/models/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final counter = Counter();

  @override
  void initState() {
    super.initState();
    counter.addListener(_onCounterChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('The counter is currently at:'),
            Text(
              '${counter.amount}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith( // Use the theme with custom style properties
                color: counter.amount > 0 ? Colors.green : Colors.red
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: .center,
              spacing: 10,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    counter.increment();
                  },
                  icon: Icon(Icons.add),
                  label: Text('Increment'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    counter.decrease();
                  },
                  icon: Icon(Icons.remove),
                  label: Text('Decrease'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.reset,
        tooltip: 'Reset',
        child: const Icon(Icons.clear),
      ),
    );
  }

  void _onCounterChanged() {
    setState(() {});
  }

  @override
  /// Dispose all listeners to avoid memory leaks
  void dispose() {
    counter.removeListener(_onCounterChanged);
    counter.dispose();
    super.dispose();
  }
}
