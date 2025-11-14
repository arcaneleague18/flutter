//mediaquery
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: mediaq(),
      home: mediaqwithbreakpoints(),
    );
  }
}

class mediaq extends StatelessWidget{
  const mediaq({super.key});

  @override
  Widget build(BuildContext c){
    final double w = MediaQuery.of(c).size.width;
    return Scaffold(
      body:w<=400?Text("Mobile"):Text("Desktop"),
    );
  }
}

class mediaqwithbreakpoints extends StatelessWidget {
  const mediaqwithbreakpoints({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    Widget scr;
    if(screenWidth <= 400){
      scr = Text("mobile view");
    }else{
      scr = Text("Desktop View");
    }
    return Scaffold(
      body: Center(
      child:scr,
      )
    );
  }
}

// // 4a) Navigation between pages
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FirstScreen(),
//     );
//   }
// }
// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('First Screen')),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Go to Second Screen'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondScreen()),//see here
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second Screen')),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Go Back'),
//           onPressed: () {
//             Navigator.pop(context); // goes back to the first screen
//           },
//         ),
//       ),
//     );
//   }
// }


//4b)NAvigation using Routes
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // start here
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Screen'),
          onPressed: () { Navigator.pushNamed(context, '/second');},
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
    );
  }
}


// 5a)Stateful and stateless
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Stateless Widget — does NOT change
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
      appBar: AppBar(title: Text('Text Displayed using-Stateless Widget')),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextWidget(),     // stateless
          Text('Stateless'),
          CounterWidge(),  // stateful
        ],
      ),
    ),
    );
  }
}

// StatefulWidget — can change over time
class CounterWidge extends StatefulWidget {
  @override
  _CounterWidgeState createState() => _CounterWidgeState();
}

class _CounterWidgeState extends State<CounterWidge> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Stateful widget'),
        Text('Counter: $count', style: TextStyle(fontSize: 20)),
        ElevatedButton(
          onPressed: () => setState(() => count++), // updates UI
          child: Text('Increase'),
        ),
      ],
    );
  }
}

//5b)State management with state and provider
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

//  Provider model
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // tells listeners to rebuild
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreen());
  }
}

//  Using setState()
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  
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

//Custom widget and themes
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.amber),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widget + Theme")),
      body: Center(
        child : Column(children: [
          Text("THIS IS THE THEME WHICH IS SET ABOVE FOR TEXT",style: Theme.of(context).textTheme.bodyMedium),//IMP
          //use of widget
          MyBox(
          text: "Hello Flutter! Using Custom Widget",
        ),
        ],)

      ),
    );
  }
}

// ---------- CUSTOM WIDGET ----------
class MyBox extends StatelessWidget {
  final String text;
  const MyBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 135, 6, 6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

// form validator
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: validate(),
    );
  }
}

class validate extends StatefulWidget{
  const validate({super.key});
  State<validate> createState() => _valstate();
}
class _valstate extends State<validate>{
  final _key =GlobalKey<FormState>();
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Form(
          key:_key,
          child:Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Name"),
              validator: (v) => v!.isEmpty?"Enter name":null,
            ),
            TextFormField(
              decoration:InputDecoration(labelText:"email"),
            validator: (v) => v!.contains("@")?null:"Enter email"),
            ElevatedButton(onPressed: () {
              if(_key.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Validated!"))
                );
              }
            },
              child: Text("check"))
          ],
        ) 
        )
        ),
      );
  }
}

//animations
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimationsDemo());
    }
}

class AnimationsDemo extends StatefulWidget {
  const AnimationsDemo({super.key});
  @override
  State<AnimationsDemo> createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<AnimationsDemo> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AnimatedOpacity(
            opacity: show ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: const Text("Fade Animation"),
          ),
          const SizedBox(height: 20),
          AnimatedSlide(
            offset: show ? Offset.zero : const Offset(1, 0),
            duration: const Duration(milliseconds: 500),
            child: const Text("Slide Animation"),
          ),
            AnimatedRotation(
            turns: show ? 1 : 0, // 1 turn = full 360° rotation
            duration: const Duration(milliseconds: 500),
            child: const Icon(Icons.star),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => setState(() => show = !show),
            child: const Text("Toggle"),
          )
        ]),
      ),
    );
  }
}
