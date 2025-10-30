//setState
import 'package:flutter/material.dart';

void main() => runApp(SetStateExample());

class SetStateExample extends StatefulWidget {
  @override
  _SetStateExampleState createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('setState Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count: $count'),
              ElevatedButton(
                onPressed: () => setState(() => count++),
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Provider
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => Counter(),
    child: ProviderExample(),
  ),
);

class Counter extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<Counter>();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Provider Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count: ${counter.count}'),
              ElevatedButton(
                onPressed: counter.increment,
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
}
