

import 'package:flutter/material.dart';

import '../Enum/EditorToolbarAction.dart';

abstract class TextEditorEvent {}

class OnToolSelectEvent extends TextEditorEvent {
  EditorToolbarAction currentTool;

  OnToolSelectEvent({required this.currentTool});
}

class OnSelectFontEvent extends TextEditorEvent {
  TextStyle textStyle;

  OnSelectFontEvent({required this.textStyle});
}

class OnSelectTextFormatToolEvent extends TextEditorEvent {
  TextStyle textStyle;

  OnSelectTextFormatToolEvent({required this.textStyle});
}

class OnFontSizeEditedEvent extends TextEditorEvent {
  TextStyle textStyle;

  OnFontSizeEditedEvent({required this.textStyle});
}

class OnColorPickedEvent extends TextEditorEvent {
  TextStyle textStyle;

  OnColorPickedEvent({required this.textStyle});
}

class OnBackgroundColorPickedEvent extends TextEditorEvent {
  TextStyle textStyle;

  OnBackgroundColorPickedEvent({required this.textStyle});
}

class OnTextAlignEditedEvent extends TextEditorEvent {
  TextAlign textAlign;

  OnTextAlignEditedEvent({required this.textAlign});
}

class EditorInitialEvent extends TextEditorEvent {
  late EditorToolbarAction initialTool;
  late TextStyle textStyle;
  late TextAlign textAlign;
  late List<Color> paletteColors = [];

  EditorInitialEvent(
      {required this.textStyle,
      required this.initialTool,
      required this.paletteColors,
      required this.textAlign});
}

class OnDoneEvent extends TextEditorEvent {
  dynamic text;
  late TextStyle textStyle;

  OnDoneEvent({
    required this.textStyle,
    required this.text,
  });
}
