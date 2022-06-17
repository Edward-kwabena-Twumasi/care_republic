import 'package:flutter/material.dart';

class ShopCreationSuccessScreen extends StatefulWidget {
  const ShopCreationSuccessScreen({Key? key}) : super(key: key);

  @override
  _ShopCreationSuccessScreenState createState() => _ShopCreationSuccessScreenState();
}

class _ShopCreationSuccessScreenState extends State<ShopCreationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Shop Created Successfully"),
      ),
    );
  }
}
