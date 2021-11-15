// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

final IFrameElement _iframeElement = IFrameElement()
  ..style.width = '100%'
  ..style.height = '100%'
  ..width = '200.0'
  ..height = '200.0'
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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SizedBox(
          height: 200,
          width: 200,
          child: _iframeWidget,
        ));
  }
}
