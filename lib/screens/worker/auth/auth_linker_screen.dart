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
        title: const FittedBox(child: Text('Choose your specialization')),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text('B'),
                backgroundColor: Colors.blue,
              ),
              title: Text('Barber'),
              onTap: () {},
            ),
            ListTile(
                leading: CircleAvatar(
                  child: Text('H'),
                  backgroundColor: Colors.blue,
                ),
                title: Text('Hair dresser'),
                onTap: () {}),
            ListTile(
                leading: CircleAvatar(
                  child: Text('M'),
                  backgroundColor: Colors.blue,
                ),
                title: Text('Makeup artist'),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
