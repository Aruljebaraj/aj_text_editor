// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FontSizeTool extends StatelessWidget {
  double fontSize;
  double letterSpacing;
  double letterHeight;
  final Function(
    double fontSize,
    double letterSpacing,
    double letterHeight,
  ) onFontSizeEdited;

  FontSizeTool({
    super.key,
    required this.onFontSizeEdited,
    this.fontSize = 0,
    this.letterSpacing = 0,
    this.letterHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _ResizeSlider(
            value: fontSize,
            icon: Icons.format_size,
            min: 0,
            onChange: (value) {
              fontSize = value;
              onFontSizeEdited(fontSize, letterSpacing, letterHeight);
            },
          ),
          _ResizeSlider(
            value: letterHeight,
            icon: Icons.format_line_spacing,
            max: 10,
            min: 1,
            onChange: (value) {
              letterHeight = value;
              onFontSizeEdited(fontSize, letterSpacing, letterHeight);
            },
          ),
          _ResizeSlider(
            value: letterSpacing,
            icon: Icons.settings_ethernet,
            max: 10,
            min: 1,
            onChange: (value) {
              letterSpacing = value;
              onFontSizeEdited(fontSize, letterSpacing, letterHeight);
            },
          ),
        ],
      ),
    );
  }
}

class _ResizeSlider extends StatefulWidget {
  final double value;
  final double? min;
  final double? max;
  final IconData icon;
  final Function(double) onChange;

  const _ResizeSlider({
    required this.value,
    required this.icon,
    required this.onChange,
    this.max = 100,
    this.min = 0,
  });

  @override
  _ResizeSliderState createState() => _ResizeSliderState();
}

class _ResizeSliderState extends State<_ResizeSlider> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: Theme.of(context).colorScheme.surface,
              inactiveTrackColor: Theme.of(context).colorScheme.surface,
              thumbColor: Theme.of(context).colorScheme.surface,
              overlayColor:
                  Theme.of(context).colorScheme.surface.withOpacity(0.2),
              trackHeight: 2,
            ),
            child: Slider(
              value: _value,
              onChanged: (value) {
                setState(() => _value = value);

                widget.onChange(value);
              },
              min: widget.min!,
              max: widget.max!,
            ),
          ),
        ),
        Text(_value.toStringAsFixed(1)),
      ],
    );
  }
}
