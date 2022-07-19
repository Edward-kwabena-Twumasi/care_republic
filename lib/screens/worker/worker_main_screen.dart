import 'package:flutter/material.dart';

class WorkerMainScreen extends StatefulWidget {
  const WorkerMainScreen({Key? key}) : super(key: key);

  @override
  _WorkerMainScreenState createState() => _WorkerMainScreenState();
}

class _WorkerMainScreenState extends State<WorkerMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('Worker Main Screen'),
        ),
      ),

    );
  }
}
