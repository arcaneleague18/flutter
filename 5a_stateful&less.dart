import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 🧱 Stateless Widget — does NOT change
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless vs Stateful')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(),     // stateless
          CounterWidget(),  // stateful
        ],
      ),
    );
  }
}

// 🧩 StatelessWidget — static UI
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('I am Stateless!', style: TextStyle(fontSize: 20)));
  }
}

// ⚙️ StatefulWidget — can change over time
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $count', style: TextStyle(fontSize: 20)),
        ElevatedButton(
          onPressed: () => setState(() => count++), // updates UI
          child: Text('Increase'),
        ),
      ],
    );
  }
}