import 'dart:async';

import 'package:aj_text_formatter/Bloc/TextEditorEvent.dart';
import 'package:aj_text_formatter/Bloc/TextEditorState.dart';
import 'package:aj_text_formatter/Enum/EditorToolbarAction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextEditorBloc extends Bloc<TextEditorEvent, TextEditorState> {
  TextEditorBloc() : super(TextEditorInitial()) {
    on<EditorInitialEvent>(onInitialEvent);
    on<OnToolSelectEvent>(onToolSelection);
    on<OnSelectFontEvent>(onSelectFont);
    on<OnSelectTextFormatToolEvent>(onSelectTextFormatTool);
    on<OnTextAlignEditedEvent>(onTextAlignEdited);
    on<OnFontSizeEditedEvent>(onFontSizeEdited);
    on<OnColorPickedEvent>(onColorPicked);
    on<OnBackgroundColorPickedEvent>(onBackgroundColorPicked);
    on<OnDoneEvent>(onDonePressed);
  }

  EditorToolbarAction currentTool = EditorToolbarAction.fontFamilyTool;
  TextStyle textStyle = const TextStyle();
  TextAlign textAlign = TextAlign.start;
  List<Color> paletteColors = [];
  List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];
  double toolBarHeight = 0;

  FutureOr<void> onInitialEvent(
      EditorInitialEvent event, Emitter<TextEditorState> emit) {
    emit(TextEditorLoading());
    currentTool = event.initialTool;
    textStyle = event.textStyle;
    textAlign = event.textAlign;
    paletteColors = event.paletteColors;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onToolSelection(
      OnToolSelectEvent event, Emitter<TextEditorState> emit) {
    currentTool = event.currentTool;
    toolBarHeight = 300;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onSelectFont(
      OnSelectFontEvent event, Emitter<TextEditorState> emit) {
    textStyle = event.textStyle;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onSelectTextFormatTool(
      OnSelectTextFormatToolEvent event, Emitter<TextEditorState> emit) {
    textStyle = event.textStyle;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onTextAlignEdited(
      OnTextAlignEditedEvent event, Emitter<TextEditorState> emit) {
    textAlign = event.textAlign;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onFontSizeEdited(
      OnFontSizeEditedEvent event, Emitter<TextEditorState> emit) {
    textStyle = event.textStyle;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onColorPicked(
      OnColorPickedEvent event, Emitter<TextEditorState> emit) {
    textStyle = event.textStyle;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onBackgroundColorPicked(
      OnBackgroundColorPickedEvent event, Emitter<TextEditorState> emit) {
    textStyle = event.textStyle;
    emit(TextEditorLoaded());
  }

  FutureOr<void> onDonePressed(
      OnDoneEvent event, Emitter<TextEditorState> emit) {
    textStyle = event.textStyle;
    toolBarHeight = 0;
    emit(TextEditorLoaded());
  }
}
