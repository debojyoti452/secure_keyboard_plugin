import 'package:flutter/material.dart';
import 'package:secure_keyboard/secure_keyboard.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _SecureNumDemo(),
                      ));
                },
                child: const Text('Secure Numeric Keyboard')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _SecureAlphabetDemo(),
                      ));
                },
                child: const Text('Secure Alphabet Keyboard')),
          ],
        ),
      ),
    );
  }
}

/// Secure Alphabet Keyboard
class _SecureAlphabetDemo extends StatefulWidget {
  const _SecureAlphabetDemo({Key? key}) : super(key: key);

  @override
  State<_SecureAlphabetDemo> createState() => _SecureAlphabetDemoState();
}

class _SecureAlphabetDemoState extends State<_SecureAlphabetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Expanded(child: Container()),
            Container(
              alignment: Alignment.bottomCenter,
              child: SecureNumericKeyboard(
                onKeyboardTap: (key) {
                  debugPrint(key);
                },
              ),
            ),
          ],
        ));
  }
}

/// Secure Numeric Keyboard
class _SecureNumDemo extends StatefulWidget {
  const _SecureNumDemo({Key? key}) : super(key: key);

  @override
  State<_SecureNumDemo> createState() => _SecureNumDemoState();
}

class _SecureNumDemoState extends State<_SecureNumDemo> {
  final List<String> _keys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Secure Numeric Keyboard'),
              const SizedBox(height: 20),
              const Text('Enter your PIN'),
              const SizedBox(height: 20),
              AnimatedBuilder(
                  animation: Listenable.merge([ValueNotifier(_keys)]),
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < _keys.length; i++)
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                _keys[i],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        for (var i = 0; i < 4 - _keys.length; i++)
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                '_',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                  child: const SizedBox.shrink()),
            ],
          )),
          Container(
            alignment: Alignment.bottomCenter,
            child: SecureNumericKeyboard(
              onKeyboardTap: (key) {
                debugPrint(key);
                if (key == 'backspace') {
                  if (_keys.isNotEmpty) {
                    _keys.removeLast();
                  }
                } else {
                  if (_keys.length < 4) {
                    _keys.add(key);
                  }
                }
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
