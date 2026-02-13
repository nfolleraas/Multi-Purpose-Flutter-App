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
            const Text('Current counter:'),
            Text(
              '${counter.amount}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
