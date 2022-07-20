/*profileGenerator(List _ids){
 // print(_ids);
  _ids.forEach((e){
    //print(_ids.length)
   // print(e.split('-')[1]);

    switch(e.split('-')[1]){
      case '1': print("User is a client");
      break;
      case '2': print("User is a Barber");
      break;
      case '3': print("User is a Hair dresser");
      break;
      case '4': print("User is a Makeup artist");
      break;
      case '5': print("User is a Merchant");
      break;
      case '6': print("User is a Makeup");
      break;
      case '7': print("User is a unisex");
      break;
      case '8': print("User is a saloon");
      break;
      default:
        print("User is a barbering shop");
    }
  });
}*/

import 'package:flutter/material.dart';
import 'package:thecut/screens/client/client_main_screen.dart';
import 'package:thecut/screens/shop/shop_main_screen.dart';
import 'package:thecut/screens/worker/worker_main_screen.dart';

List<Widget> profileGenerator(List _ids, BuildContext buildContext) {
  // print(_ids);
  return _ids.map((e) {
    //print(_ids.length)
    // print(e.split('-')[1]);

    switch (e.split('-')[1]) {
      case '1':
        print("User is a client");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: (){
              Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                return const ClientMainScreen();
              }));
            },
            dense: true,
            title: const Text("Client"),
            tileColor: const Color(0x40ff8e8e),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        );
      case '2':
        print("User is a Barber");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: (){
              Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                return const WorkerMainScreen();
              }));
            },
            dense: true,
              title: const Text("Barber"),
              tileColor: const Color(0x40ff7979),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
      case '3':
        print("User is a Hair dresser");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              onTap: (){
                Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                  return const WorkerMainScreen();
                }));
              },
              dense: true,
              title: const Text("Hair dresser"),
              tileColor: const Color(0x40ff7f7f),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
      case '4':
        print("User is a Makeup artist");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              dense: true,
              title: const Text("Make up artist"),
              tileColor: const Color(0x40ff6464),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
      case '5':
        print("User is a Merchant");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              onTap: (){
                Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                  return const ShopMainScreen();
                }));
              },
              dense: true,
              title: const Text("Merchant"),
              tileColor: const Color(0x40ff7070),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
      case '6':
        print("User is a Makeup");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              onTap: (){
                Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                  return const ShopMainScreen();
                }));
              },
              dense: true,
              title: const Text("Makeup shop"),
              tileColor: const Color(0x40f62424),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
      case '7':
        print("User is a unisex");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              onTap: (){
                Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                  return const ShopMainScreen();
                }));
              },
              dense: true,
              title: const Text("Unisex Saloon"),
              tileColor: const Color(0x40ff6e6e),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
      case '8':
        print("User is a saloon");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              onTap: (){
                Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                  return const ShopMainScreen();
                }));
              },
              dense: true,
              title: const Text("Hair dressing saloon"),
              tileColor: const Color(0x40ff5a5a),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
      default:
        print("User is a barbering shop");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
              onTap: (){
                Navigator.pushReplacement(buildContext, MaterialPageRoute(builder: (_){
                  return const ShopMainScreen();
                }));
              },
              dense: true,
              title: const Text("Barbering shop"),
              tileColor: const Color(0x40ff5a5a),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        );
    }
  }).toList();
}
