import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Fun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/other': (context) => OtherPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Fun'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Do you like this page?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ButtonRow(),
          ],
        ),
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  final Random _random = Random();
  double _noButtonX = 0.0;
  double _noButtonY = 0.0;

  void _moveNoButton() {
    setState(() {
      _noButtonX = _random.nextDouble() * MediaQuery.of(context).size.width - 50;
      _noButtonY = _random.nextDouble() * MediaQuery.of(context).size.height - 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _noButtonX,
          top: _noButtonY,
          child: ElevatedButton(
            onPressed: _moveNoButton,
            child: Text('No'),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/other');
            },
            child: Text('Yes'),
          ),
        ),
      ],
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text(
          'Welcome to the other page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}