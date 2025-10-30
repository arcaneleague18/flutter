import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add provider in pubspec.yaml

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreen());
  }
}

// ⚙️ Using setState()
class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int localCount = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('State Management Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('setState count: $localCount'),
            Text('Provider count: ${provider.count}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => localCount++),
              child: Text('Increase (setState)'),
            ),
            ElevatedButton(
              onPressed: provider.increment,
              child: Text('Increase (Provider)'),
            ),
          ],
        ),
      ),
    );
  }
}

// 🧩 Provider model
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // tells listeners to rebuild
  }
}