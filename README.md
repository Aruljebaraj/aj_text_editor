Text Editor

Welcome to the The AJ text editor provides you with complete control over your text formatting.

Its intuitive interface allows you to easily adjust text colour, size, and font to match your style
😊🖋️📝

Features:

The AJ text editor empowers you to fully control your text formatting.
easily select and change fonts,
adjust text size,
change background color,
customize text color, and modify spacing.
With these features, you can tailor your content effortlessly to match your style. 😊🖋️📝

## Screenshot
![AjEditor](https://github.com/Aruljebaraj/aj_text_editor/blob/main/screenshot/screenshot.png?raw=true)

### Quick Example

```dart
import 'package:aj_text_editor/aj_text_editor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Aj Text Editor')),
        body: const TextEditor(),
      ),
    );
  }
}

class TextEditor extends StatelessWidget {
  const TextEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextStyleEditor();
  }
}
```

