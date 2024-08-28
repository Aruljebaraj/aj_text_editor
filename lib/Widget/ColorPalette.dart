// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'ColorHolder.dart';

class ColorPalette extends StatefulWidget {
  final Color? activeColor;
  final List<Color> colors;
  final Function(Color) onColorPicked;

  const ColorPalette({
    super.key,
    this.activeColor,
    required this.onColorPicked,
    required this.colors,
  });

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  late Color _activeColor;

  @override
  void initState() {
    _activeColor = widget.activeColor ?? widget.colors[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: widget.colors
          .map(
            (color) => ColorHolder(
              color: color,
              active: color == _activeColor,
              onTap: (color) {
                setState(() => _activeColor = color);
                widget.onColorPicked(color);
              },
            ),
          )
          .toList(),
    );
  }
}
