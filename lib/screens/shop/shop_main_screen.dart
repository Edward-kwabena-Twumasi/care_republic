import 'package:flutter/material.dart';

class ShopMainScreen extends StatefulWidget {
 final String source;
  const ShopMainScreen({Key? key,required this.source}) : super(key: key);

  @override
  _ShopMainScreenState createState() => _ShopMainScreenState();
}

class _ShopMainScreenState extends State<ShopMainScreen> {
  @override
  Widget build( BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop Main Screen'),),
      body: Container(
        child: const Center(
          child: Text('Under Review'),
        ),
      ),

    );
  }
}
