import 'package:flutter/material.dart';

import 'ColorPalette.dart';

class FontColorTool extends StatelessWidget {
  final List<Color> colors;
  final Color? activeColor;
  final Function(Color) onColorPicked;

  const FontColorTool({super.key,
    required this.colors,
    required this.onColorPicked,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ColorPalette(
      activeColor: activeColor,
      onColorPicked: onColorPicked,
      colors: colors,
    );
  }
}
