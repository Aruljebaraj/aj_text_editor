import 'package:aj_text_editor/Enum/EditorToolbarAction.dart';
import 'package:flutter/material.dart';

import 'OptionButton.dart';

class Toolbar extends StatelessWidget {
  final EditorToolbarAction initialTool;
  final Function(EditorToolbarAction) onToolSelect;
  final Function() onDone;

  const Toolbar({
    super.key,
    this.initialTool = EditorToolbarAction.editor,
    required this.onToolSelect,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionButton(
          isActive: initialTool == EditorToolbarAction.fontFamilyTool,
          child: const Icon(Icons.title),
          onPressed: () {
            onToolSelect(EditorToolbarAction.fontFamilyTool);
          },
        ),
        OptionButton(
          isActive: initialTool == EditorToolbarAction.fontOptionTool,
          child: const Icon(Icons.strikethrough_s),
          onPressed: () {
            onToolSelect(EditorToolbarAction.fontOptionTool);
          },
        ),
        OptionButton(
          isActive: initialTool == EditorToolbarAction.fontSizeTool,
          child: const Icon(Icons.format_size),
          onPressed: () {
            onToolSelect(EditorToolbarAction.fontSizeTool);
          },
        ),
        OptionButton(
          isActive: initialTool == EditorToolbarAction.fontColorTool,
          child: const Icon(Icons.format_color_text),
          onPressed: () {
            onToolSelect(EditorToolbarAction.fontColorTool);
          },
        ),
        OptionButton(
          isActive: initialTool == EditorToolbarAction.backgroundColorTool,
          child: const Icon(Icons.format_color_fill),
          onPressed: () {
            onToolSelect(EditorToolbarAction.backgroundColorTool);
          },
        ),
        TextButton(
            onPressed: () {
              onDone();
            },
            child: const Text('Done'))
      ],
    );
  }
}
