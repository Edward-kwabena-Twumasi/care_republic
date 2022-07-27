import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thecut/theme/custom_theme.dart';

class BarberAboutScreen extends StatefulWidget {
  const BarberAboutScreen({Key? key}) : super(key: key);

  @override
  _BarberAboutScreenState createState() => _BarberAboutScreenState();
}

class _BarberAboutScreenState extends State<BarberAboutScreen> {
  Map<String, dynamic> barber = {};
 // late StreamSubscription barberSubscription;
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
   // barberSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: Colors.black.withOpacity(0.8),
          elevation:0.0,
           title: Text("Profile"),
        leading: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                         
                        )),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
               
                Stack(children: [
                            Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                              color: Colors.amber.withOpacity(0.8), width: 3),
                          )
                              ),

                                Positioned(
                    right: 0.2,
                    bottom: 5,
                                 child: Container(
                                                       height: 100,
                                                       width: 100,
                                                       decoration: BoxDecoration(
                                                           shape: BoxShape.circle,
                                                           color: Colors.transparent,
                                                           border: Border.all(
                                                               color: Colors.pink.withOpacity(0.8), width: 5),
                                                           )
                                                               ),
                               ),
                                Positioned(
                    left: 4,
                    top: 4,
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //     color: Colors.white.withOpacity(0.8), width: 4),
                            image: DecorationImage(
                                image: AssetImage(
                                  "images/nicesalon.jpg",
                                ),
                                fit: BoxFit.cover))
                                ),
                  ),

                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Text(barber["name"]??"...", style:textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold,color: colorScheme.primary)),
                ),
                
              ],
            ),
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )),
                  child: BarberHome(barber: barber,)))
        ],
      ),
    );
  }
}

//shop info tabs
class BarberHome extends StatefulWidget {
  const BarberHome({Key? key,required this.barber}) : super(key: key);
final Map<String,dynamic> barber;
  @override
  _BarberHomeState createState() => _BarberHomeState();
}

class _BarberHomeState extends State<BarberHome> with TickerProviderStateMixin {
  // int initial = 0;
  // TabController tabController =
  //     TabController(
  //       initialIndex: 0,
  //       length: 4, vsync: );

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            titleSpacing: 0,
            backgroundColor: Colors.white,
            elevation: 6,
            bottom: TabBar(
              indicatorColor: Colors.green,
              labelStyle: TextStyle(color: Colors.green),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green,
              tabs: [
                Tab(
                  text: "Basic Info",
                ),
                Tab(
                  text: "Review",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            About(context,widget.barber),
            Center(
              child: Text("Barber reviews"),
            )
          ],
        ),
      ),
    );
  }
}

Widget About(BuildContext context,Map<String,dynamic> barber) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Contact",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(title: Text("Email"), subtitle: Text(barber["email"] ?? "...")),
        ListTile(title: Text("Phone"), subtitle: Text(barber["phone"] ?? "...")),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text("Social", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Wrap(children: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.facebook)),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.twitter)),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.instagram)),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.whatsapp)),
        ]),
         Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Address",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(title: Text("House number"), subtitle: Text("AH-0985")),
        ListTile(title: Text("Post"), subtitle: Text("Box 56")),
      ],
    ),
  );
}

Widget Gallery(BuildContext context) {
  return SingleChildScrollView(
    child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 9.8,
        child: GridView.builder(
            itemCount: 7,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
            itemBuilder: (context, photos) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("images/manshaving.jpg"),
                        fit: BoxFit.cover)),
                height: 150,
                child: Text("Nice fade"),
              );
            }),
      ),
    ),
  );
}

Widget chatCard(
    String img, String name, String date, String time, String message) {
  return SizedBox(
      height: 80,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(img),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name),
                          Wrap(children: [
                            Text("4.3"),
                            Icon(Icons.star, color: Colors.amber)
                          ])
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
                child: Text(
                    "This is my review about this shop after having theri service"))
          ],
        ),
      ));
}

Widget Review(BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: items.length,
    padding: const EdgeInsets.symmetric(vertical: 16),
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: chatCard(
            items[index]["img"],
            items[index]["name"],
            items[index]["date"],
            items[index]["time"],
            items[index]["message"]),
      );
    },
  );
}

List items = [
  {
    "img": "images/nicesalon.jpg",
    "name": "Kay",
    "date": "20th Oct",
    "time": "12:00 pm",
    "message": "Hello"
  },
  {
    "img": "images/salon.jpg",
    "name": "Joe",
    "date": "20th Oct",
    "time": "12:00 pm",
    "message": "Are you there?"
  },
];
