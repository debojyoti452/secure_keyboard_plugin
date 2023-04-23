import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseKeyboardWrapper<T extends StatefulWidget> extends State<T> {
  void onKeyboardTapped(String key);

  Widget child(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          final key = event.logicalKey.keyLabel;
          onKeyboardTapped(key);
        }
      },
      child: child(context),
    );
  }

  List<List<int>> secureGeneratePinKeyboardPattern() {
    final list = List.generate(10, (index) => index);
    list.shuffle();
    return [
      [list[0], list[1], list[2]],
      [list[3], list[4], list[5]],
      [list[6], list[7], list[8]],
      [-1, list[9], -2],
    ];
  }

  List<Color?> secureGeneratePinKeyboardColors() {
    final list = List.generate(10, (index) => index);
    list.shuffle();
    return [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.yellow,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.brown,
    ];
  }
}
