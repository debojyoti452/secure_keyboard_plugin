import 'package:flutter/material.dart';
import 'package:secure_keyboard/src/base/base_keyboard_wrapper.dart';

typedef OnKeyboardTap = void Function(String key);

class SecureNumericKeyboard extends StatefulWidget {
  const SecureNumericKeyboard({
    Key? key,
    required this.onKeyboardTap,
  }) : super(key: key);

  final OnKeyboardTap onKeyboardTap;
  @override
  State<SecureNumericKeyboard> createState() => _SecureNumericKeyboardState();
}

class _SecureNumericKeyboardState
    extends BaseKeyboardWrapper<SecureNumericKeyboard>
    with WidgetsBindingObserver {
  var randomized = [];
  var colors = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    randomized = secureGeneratePinKeyboardPattern();
    colors = secureGeneratePinKeyboardColors();
    super.initState();
  }

  @override
  Widget child(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          for (var row in randomized)
            Row(
              children: [
                for (var key in row)
                  if (key == -1)
                    const Expanded(
                      child: SizedBox(
                        height: 50,
                      ),
                    )
                  else if (key == -2)
                    Expanded(
                      child: Container(
                        height: 70,
                        color: Colors.grey,
                        child: TextButton(
                          onPressed: () => onKeyboardTapped('backspace'),
                          child: const Icon(
                            Icons.backspace,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: Container(
                        height: 70,
                        color: secureGeneratePinKeyboardColors()[key],
                        child: TextButton(
                          onPressed: () => onKeyboardTapped('$key'),
                          child: Text(
                            '$key',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  void onKeyboardTapped(String key) {
    widget.onKeyboardTap(key);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        randomized = secureGeneratePinKeyboardPattern();
        colors = secureGeneratePinKeyboardColors();
      });
    }
  }
}
