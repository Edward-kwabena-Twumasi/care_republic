import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ShopClients extends StatefulWidget {
  ShopClients({Key? key}) : super(key: key);

  @override
  _ShopClientsState createState() => _ShopClientsState();
}

class _ShopClientsState extends State<ShopClients> {
  int total=6;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children:[
       AppBar(
         title: Text("My Clients"),
       ),

       Expanded(child: ListView.builder(
           itemCount: 9,
           itemBuilder: (context,i)=>
           ListTile(
             leading: CircleAvatar(),
             title: Text("Julie"),
             subtitle: Text(" Last visited today"),
           )
       ))

                    
      ]
    );
  }
}


class ShopClient extends StatelessWidget {
  const ShopClient({Key? key,required this.name,required this.phone}) : super(key: key);
final String name;
final String phone;
  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(name),

      subtitle: Text(phone),

    );
  }
}
