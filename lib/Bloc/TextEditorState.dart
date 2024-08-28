// ignore_for_file: file_names

abstract class TextEditorState {}

abstract class TextEditorActionState extends TextEditorState {}

class SelectToolBarOption extends TextEditorState {}

class TextEditorInitial extends TextEditorState {}
class TextEditorLoading extends TextEditorState {}

class TextEditorLoaded extends TextEditorState {}
