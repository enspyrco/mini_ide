// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

final IFrameElement _iframeElement = IFrameElement()
  ..style.width = '100%'
  ..style.height = '100%'
  ..src = 'inner.html'
  ..style.border = 'none';
Widget _iframeWidget = HtmlElementView(
  key: UniqueKey(),
  viewType: 'iframeElement',
);

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
    'iframeElement',
    (int viewId) => _iframeElement,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monaco Editor in Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EditorRotate(),
    );
  }
}

class EditorRotate extends StatefulWidget {
  const EditorRotate({Key? key}) : super(key: key);

  @override
  State<EditorRotate> createState() => EditorRotateState();
}

class EditorRotateState extends State<EditorRotate> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('Rotate'),
          onPressed: _changeRotation,
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: AnimatedRotation(
            turns: turns,
            duration: const Duration(seconds: 1),
            child: Center(
              child: SizedBox(
                height: 500,
                width: 500,
                child: _iframeWidget,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
