import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thecut/screens/client/client_home_screen.dart';
import 'package:thecut/screens/client/client_map_screen.dart';
import 'package:thecut/screens/client/client_unauthed_screen.dart';

class ClientMainScreen extends StatefulWidget {
  const ClientMainScreen({Key? key}) : super(key: key);

  @override
  _ClientMainScreenState createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
  int index = 0;

  List<Widget> pages = [
    ClientHomeScreen(),
    ClientMapScreen(),
    ClientUnAuthedScreen(),
    ClientUnAuthedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        displacement: 250,
        backgroundColor: Colors.yellow,
        color: Colors.red,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          print("Refreshing");
        },
        child: SafeArea(
            child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            
             /* type: BottomNavigationBarType.shifting,*/
              backgroundColor: const Color.fromARGB(255, 61, 13, 13),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black54,
              currentIndex: index,
              onTap: (newIndex) {
                setState(() {
                  index = newIndex;
                  //index > 0 ? showsearch = false : showsearch = true;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.place), label: "Near by"),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.heart), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: "Appointments"),
              ]),
          body: pages.elementAt(index),
        )));
  }
}
