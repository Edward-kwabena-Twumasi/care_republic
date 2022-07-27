import 'package:flutter/material.dart';
import 'package:thecut/scaling/scaler.dart';

class ShopNotificationListScreen extends StatefulWidget {
  const ShopNotificationListScreen({Key? key}) : super(key: key);

  @override
  _ShopNotificationListScreenState createState() => _ShopNotificationListScreenState();
}

class _ShopNotificationListScreenState extends State<ShopNotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    Sizer size= Sizer(context:context,hasAppBar:true);
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'),),
      body: Column( children:  [
        Padding(
          padding: EdgeInsets.all(size.cw(1)),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(radius: size.cw(5),child: Text('P'),),
              title: Text('Payment Successful'),
              subtitle: Text('An amount of GHC50 has been credited to your account'),
            ),
          ),
        )
      ],),
    );
  }
}
