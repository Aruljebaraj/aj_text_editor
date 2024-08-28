import 'package:flutter/material.dart';

import 'OptionButton.dart';

class FontFamily extends StatelessWidget {
  final String font;
  final bool isSelected;
  final Function(String) onSelect;

  const FontFamily(this.font, {super.key, required this.onSelect, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return OptionButton(
      isActive: isSelected,
      size: const Size(90, 45),
      onPressed: () => onSelect(font),
      child: Center(child: Text(font, style: TextStyle(fontFamily: font))),
    );
  }
}