/*
 * *
 *  * * GNU General Public License v3.0
 *  * *******************************************************************************************
 *  *  *  Created By Debojyoti Singha
 *  *  *  Copyright (c) 2023.
 *  *  * This program is free software: you can redistribute it and/or modify
 *  *  * it under the terms of the GNU General Public License as published by
 *  *  * the Free Software Foundation, either version 3 of the License, or
 *  *  * (at your option) any later version.
 *  *  *
 *  *  * This program is distributed in the hope that it will be useful,
 *  *  *
 *  *  * but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  *  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  *  * GNU General Public License for more details.
 *  *  *
 *  *  * You should have received a copy of the GNU General Public License
 *  *  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *  *  * Contact Email: support@swingtechnologies.in
 *  * ******************************************************************************************
 *
 */

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
