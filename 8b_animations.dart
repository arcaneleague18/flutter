import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: B()));

class B extends StatefulWidget {
  @override
  State<B> createState() => _BState();
}

class _BState extends State<B> with SingleTickerProviderStateMixin {
  late final AnimationController c =
      AnimationController(vsync: this, duration: Duration(seconds: 1))
        ..repeat(reverse: true);

  late final fade = Tween(begin: 0.0, end: 1.0).animate(c);
  late final slide = Tween(begin: Offset(0, 1), end: Offset.zero).animate(c);

  @override
  Widget build(context) => Scaffold(
        body: Center(
          child: FadeTransition(
            opacity: fade,
            child: SlideTransition(
              position: slide,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
          ),
        ),
      );
}