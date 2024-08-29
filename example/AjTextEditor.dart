import 'dart:developer';
import 'package:aj_text_editor/aj_text_editor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AjEditor(),
  ));
}

class AjEditor extends StatelessWidget {
  const AjEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextStyleEditor();
  }
}
