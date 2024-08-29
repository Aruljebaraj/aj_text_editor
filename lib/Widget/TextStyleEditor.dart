// ignore_for_file: library_private_types_in_public_api

library text_style_editor;

import 'package:aj_text_formatter/Bloc/TextEditorBloc.dart';
import 'package:aj_text_formatter/Bloc/TextEditorEvent.dart';
import 'package:aj_text_formatter/Bloc/TextEditorState.dart';
import 'package:aj_text_formatter/Enum/EditorToolbarAction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BackgroundColorTool.dart';
import 'ColorPalette.dart';
import 'FontFamilyTool.dart';
import 'FontSizeTool.dart';
import 'TextFormatTool.dart';
import 'Toolbar.dart';

/// Text style editor
/// A flutter widget that edit text style and text alignment
///
/// You can pass your text style or alignment to the widget
/// and then get the edited text style
class TextStyleEditor extends StatefulWidget {
  /// The initial editor tool
  final EditorToolbarAction initialTool;

  /// Editor's palette colors
  final List<Color>? paletteColors;

  /// [onTextStyleEdited] will be called after [textStyle] prop has changed
  final Function(TextStyle)? onTextStyleEdited;

  /// [onTextAlignEdited] will be called after [textAlignment] prop has changed
  final Function(TextAlign)? onTextAlignEdited;

  /// [onCapsLockToggle] will be called after caps lock has changed
  final Function(bool)? onCapsLockToggle;

  /// [onToolbarActionChanged] will be called after editor's tool has changed
  final Function(EditorToolbarAction)? onToolbarActionChanged;

  /// Create a [TextStyleEditor] widget
  ///
  /// [fonts] list of font families that you want to use in editor.
  /// [textStyle] initiate text style.
  /// [textAlign] initiate text alignment.
  ///
  /// [onTextStyleEdited] callback will be called every time [textStyle] has changed.
  /// [onTextAlignEdited] callback will be called every time [textAlign] has changed.
  /// [onCapsLockToggle] callback will be called every time caps lock has changed to off or on.
  /// [onToolbarActionChanged] callback will be called every time editor's tool has changed.
  const TextStyleEditor({
    super.key,
    this.paletteColors,
    this.initialTool = EditorToolbarAction.fontFamilyTool,
    this.onTextStyleEdited,
    this.onTextAlignEdited,
    this.onCapsLockToggle,
    this.onToolbarActionChanged,
  });

  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  final textEditorBloc = TextEditorBloc();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    textEditorBloc.add(EditorInitialEvent(
        textStyle: textEditorBloc.textStyle,
        initialTool: widget.initialTool,
        paletteColors: [
          Colors.black,
          Colors.white,
          Colors.red,
          Colors.blue,
          Colors.blueAccent,
          Colors.brown,
          Colors.green,
          Colors.indigoAccent,
          Colors.lime,
        ],
        textAlign: textEditorBloc.textAlign));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextEditorBloc, TextEditorState>(
      bloc: textEditorBloc,
      buildWhen: (previous, current) =>
      current is! TextEditorActionState,
      builder: (context, state) {
        if (state is TextEditorLoading) {
          return const CupertinoActivityIndicator();
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    border: InputBorder.none,
                    hintText: 'Type here ...',
                    hintStyle: TextStyle(color: Colors.grey)),
                style: textEditorBloc.textStyle,
                maxLines: 20,
                textAlign: textEditorBloc.textAlign,
              ),
            ),
            persistentFooterButtons: [
              Toolbar(
                initialTool: textEditorBloc.currentTool,
                onToolSelect: (action) {
                  textEditorBloc.add(OnToolSelectEvent(currentTool: action));
                  if (widget.onToolbarActionChanged != null) {
                    widget.onToolbarActionChanged!(action);
                  }
                },
                onDone: () {
                  textEditorBloc.add(OnDoneEvent(
                      textStyle: textEditorBloc.textStyle,
                      text: controller.text));
                },
              ),
              AnimatedContainer(
                padding: const EdgeInsets.symmetric(vertical: 15),
                height: textEditorBloc.toolBarHeight,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                child: SingleChildScrollView(
                  child: () {
                    switch (textEditorBloc.currentTool) {
                      case EditorToolbarAction.fontFamilyTool:
                        return FontFamilyTool(
                          fonts: textEditorBloc.fonts,
                          selectedFont: textEditorBloc.textStyle.fontFamily,
                          onSelectFont: (fontFamily) {
                            textEditorBloc.add(OnSelectFontEvent(
                                textStyle: textEditorBloc.textStyle
                                    .copyWith(fontFamily: fontFamily)));

                            if (widget.onTextStyleEdited != null) {
                              widget
                                  .onTextStyleEdited!(textEditorBloc.textStyle);
                            }
                          },
                        );
                      case EditorToolbarAction.fontOptionTool:
                        return TextFormatTool(
                          bold: textEditorBloc.textStyle.fontWeight ==
                              FontWeight.bold,
                          italic: textEditorBloc.textStyle.fontStyle ==
                              FontStyle.italic,
                          textAlign: textEditorBloc.textAlign,
                          onTextFormatEdited: (bold, italic) {
                            textEditorBloc.add(OnSelectTextFormatToolEvent(
                                textStyle: textEditorBloc.textStyle.copyWith(
                              fontWeight:
                                  bold ? FontWeight.bold : FontWeight.normal,
                              fontStyle:
                                  italic ? FontStyle.italic : FontStyle.normal,
                            )));
                            if (widget.onTextStyleEdited != null) {
                              widget
                                  .onTextStyleEdited!(textEditorBloc.textStyle);
                            }
                          },
                          onTextAlignEdited: (align) {
                            textEditorBloc
                                .add(OnTextAlignEditedEvent(textAlign: align));
                            if (widget.onTextAlignEdited != null) {
                              widget.onTextAlignEdited!(align);
                            }
                          },
                          onCapsLockToggle: (caps) {
                            if (widget.onCapsLockToggle != null) {
                              widget.onCapsLockToggle!(caps);
                            }
                          },
                        );
                      case EditorToolbarAction.fontSizeTool:
                        return FontSizeTool(
                          fontSize: textEditorBloc.textStyle.fontSize ?? 0,
                          letterHeight: textEditorBloc.textStyle.height ?? 1.2,
                          letterSpacing:
                              textEditorBloc.textStyle.letterSpacing ?? 1,
                          onFontSizeEdited: (
                            fontSize,
                            letterSpacing,
                            letterHeight,
                          ) {
                            textEditorBloc.add(OnFontSizeEditedEvent(
                                textStyle: textEditorBloc.textStyle.copyWith(
                              fontSize: fontSize,
                              height: letterHeight,
                              letterSpacing: letterSpacing,
                            )));
                            if (widget.onTextStyleEdited != null) {
                              widget
                                  .onTextStyleEdited!(textEditorBloc.textStyle);
                            }
                          },
                        );
                      case EditorToolbarAction.fontColorTool:
                        return BackgroundColorTool(
                          activeColor: textEditorBloc.textStyle.color,
                          colors: textEditorBloc.paletteColors,
                          onColorPicked: (color) {
                            textEditorBloc.add(OnColorPickedEvent(
                                textStyle: textEditorBloc.textStyle
                                    .copyWith(color: color)));

                            if (widget.onTextStyleEdited != null) {
                              widget
                                  .onTextStyleEdited!(textEditorBloc.textStyle);
                            }
                          },
                        );
                      case EditorToolbarAction.backgroundColorTool:
                        return ColorPalette(
                          activeColor: textEditorBloc.textStyle.backgroundColor,
                          colors: textEditorBloc.paletteColors,
                          onColorPicked: (color) {
                            textEditorBloc.add(OnBackgroundColorPickedEvent(
                                textStyle: textEditorBloc.textStyle
                                    .copyWith(backgroundColor: color)));
                            if (widget.onTextStyleEdited != null) {
                              widget
                                  .onTextStyleEdited!(textEditorBloc.textStyle);
                            }
                          },
                        );
                      case EditorToolbarAction.editor:
                        return Container();
                      default:
                        return Container();
                    }
                  }(),
                ),
              ),
            ],
          );
        }

        // return widget here based on BlocA's state
      },
    );
  }
}
