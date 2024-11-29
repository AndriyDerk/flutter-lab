import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  String _inputText = '';

  void _handleInputChange(String value) {
    setState(() {
      _inputText = value;

      // Перевірка на "Avada Kedavra"
      if (value == 'Avada Kedavra') {
        _counter = 0;
      } else {
        // Спроба перетворити текст на число
        final int? number = int.tryParse(value);
        if (number != null) {
          _counter += number;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Інтерактивний Лічильник'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Введіть текст або число',
                border: OutlineInputBorder(),
              ),
              onChanged: _handleInputChange,
            ),
            const SizedBox(height: 20),
            Text(
              'Поточний текст: $_inputText',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Лічильник: $_counter',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
