// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'FontFamily.dart';

class FontFamilyTool extends StatefulWidget {
  final List<String> fonts;
  final Function(String) onSelectFont;
  final String? selectedFont;

  const FontFamilyTool({super.key,
    required this.fonts,
    required this.onSelectFont,
    this.selectedFont,
  });

  @override
  _FontFamilyToolState createState() => _FontFamilyToolState();
}

class _FontFamilyToolState extends State<FontFamilyTool> {
  late String _selectedFont;

  @override
  void initState() {
    _selectedFont = widget.selectedFont ?? widget.fonts[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

      SizedBox(height: 300,width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio:2,
            crossAxisCount: 3, // number of items in each row
             mainAxisSpacing: 10.0, // spacing between rows
          ),
          itemCount: widget.fonts.length, // total number of items
          itemBuilder: (context, index) {
            return FontFamily(
              widget.fonts[index],
              isSelected: _selectedFont ==  widget.fonts[index],
              onSelect: (selectedFont) {
                setState(() => _selectedFont = selectedFont);
                widget.onSelectFont(selectedFont);
              },
            );
          },
        ),
      );
  }
}


