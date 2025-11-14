import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue, // single color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: t.primaryColor),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello', style: t.textTheme.bodyLarge),
            ElevatedButton(onPressed: () {}, child: const Text('Press'))
          ],
        ),
      ),
    );
  }
}
