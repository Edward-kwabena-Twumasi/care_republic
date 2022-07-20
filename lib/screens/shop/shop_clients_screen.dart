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
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Clients',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
          ),
        ),

       

                    
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
    return Row(

      children: [

        Padding(

          padding: const EdgeInsets.all(10.0),

          child: Container(

            height: 40,

            width: 40,

            decoration: BoxDecoration(

                borderRadius:BorderRadius.circular(50),

                image: DecorationImage(

                    image: AssetImage("images/salon.jpg"),

                    fit: BoxFit.cover)),

          ),

        ),

        Expanded(

            child: Column(

              crossAxisAlignment:CrossAxisAlignment.start,

              children: [

                ListTile(

                  title: Text(name),

                  subtitle: Text(phone),

                ),

              ],

            ))

      ],

    );
  }
}
