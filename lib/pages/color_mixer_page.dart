import 'package:flutter/material.dart';

class ColorMixerPage extends StatefulWidget {
  const ColorMixerPage({super.key, required this.title});

  final String title;

  @override
  State<ColorMixerPage> createState() => _ColorMixerPageState();
}

class _ColorMixerPageState extends State<ColorMixerPage> {
  var _red = 255;
  var _green = 255;
  var _blue = 255;
  final _opacity = 1.0;

  Color get backgroundColor => Color.fromRGBO(_red, _green, _blue, _opacity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rgbText('Red'),
            rgbSlider(_red, (value) => _red = value),
            SizedBox(height: 10),

            rgbText('Green'),
            rgbSlider(_green, (value) => _green = value),
            SizedBox(height: 10),

            rgbText('Blue'),
            rgbSlider(_blue, (value) => _blue = value),
          ],
        ),
      ),
    );
  }

  Slider rgbSlider(int value, ValueSetter<int> onChanged) {
    return Slider(
      min: 0.0,
      max: 255.0,
      value: value.toDouble(),
      onChanged: (double color) {
        setState(() => onChanged(color.toInt()));
      },
    );
  }

  Text rgbText(String colorName) {
    return Text(
      '$colorName:',
      style: TextStyle(
        fontSize: 20,
        color:
            ThemeData.estimateBrightnessForColor(backgroundColor) ==
                Brightness.light
            ? Colors.black
            : Colors.white,
      ),
    );
  }
}
