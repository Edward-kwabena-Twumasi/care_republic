//This is the shops main screen .This is what
//the shop also has bottom navs for a
//dashboad of important business information

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:badges/badges.dart';
import 'package:thecut/screens/shop/new_appointment_screen.dart';
import 'package:thecut/screens/shop/shop_clients_screen.dart';
import 'package:thecut/screens/shop/shop_dashboard_screen.dart';
import 'package:thecut/screens/shop/shop_drawer.dart';

class ShopMainScreen extends StatefulWidget {
  const ShopMainScreen({Key? key}) : super(key: key);

  @override
  ShopMainScreenState createState() => ShopMainScreenState();
}

class ShopMainScreenState extends State<ShopMainScreen> {
  // final phoneFuture = Provider.of<ApplicationProvider>(context, listen: false)
  //     .getPhoneFuture();

  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  /* late String shopname = "";
  late String shopMail = "";*/
  List<Widget> pages = [
    //dashboard
    Dashboard(),
    AppointmentPage(),
    ShopClients(),
  ];
  late StreamSubscription shopSubscription;
  late StreamSubscription pendingCountSubscription;
  late StreamSubscription paymentsCountSubscription;
 // late StreamSubscription unWatchedCountSubscription;
  late StreamSubscription confirmedCountSubscription;
  Map<String, dynamic> shopDetails = {};
  int index = 0;
  bool showsearch = true;


  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> requestOverDueSubscription1;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    /* DateTime temp = now.add(Duration(days: 1));
    DateTime tomorrow = DateTime(temp.year, temp.month, temp.day, 0, 0, 0);*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    shopSubscription.cancel();
    pendingCountSubscription.cancel();
    paymentsCountSubscription.cancel();

    requestOverDueSubscription1.cancel();
   /* unWatchedCountSubscription.cancel();*/
    confirmedCountSubscription.cancel();
  }

  

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Container(
            child: Text('Page ${index}'),
          );
        }));
        break;
    }
  }

  buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.black.withOpacity(0.64);
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(icon, color: color),
      onTap: onClicked,
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        displacement: 200,
        backgroundColor: Colors.yellow,
        color: Colors.red,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
      
    },
    child: SafeArea(
      child: Scaffold(
          key: scaffolKey,

    /*appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),*/
          drawer: ShopDrawer(),
          //shop has a dashboard,sees appointments and a
          //profile to edit to suit the business

          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              currentIndex: index,
              onTap: (newindex) {
                setState(() {
                  index = newindex;
                  //index > 0 ? showsearch = false : showsearch = true;
                });
               
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Dashboard"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.watch_later),
                    label: "Appointments"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Clients"),
              ]),
          body: pages.elementAt(index)),
    ));
  }
}

//each navigation screen is built in a different file
//for easy file handling
//
