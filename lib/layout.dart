import 'package:flutter/material.dart';
import 'package:multi_purpose_flutter_app/pages/color_mixer_page.dart';
import 'package:multi_purpose_flutter_app/pages/counter_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Logic to choose a page to load
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = CounterPage(title: 'Counter');
      case 1:
        page = ColorMixerPage(title: 'Color Mixer');
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600, // Show extended mode (labels visible) when the screen width >= 600px
                  // Define visuals for destinations
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.numbers),
                      label: Text('Counter Page'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.color_lens), 
                      label: Text('Color Mixer Page')
                      ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    // Notify the state that the value of selectedIndex has been changed
                    setState(() {
                      selectedIndex = value; // Value is the index of the selected page
                    });
                  },
                ),
              ),
              // The allocated space for the loaded page
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
