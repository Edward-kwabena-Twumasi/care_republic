import 'package:flutter/material.dart';

class AuthLinkerScreen extends StatefulWidget {
  const AuthLinkerScreen({Key? key}) : super(key: key);

  @override
  _AuthLinkerScreenState createState() => _AuthLinkerScreenState();
}

class _AuthLinkerScreenState extends State<AuthLinkerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your role'),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(child: const Text('Shop Screen Under Review'),),
      ),
    );
  }
}
