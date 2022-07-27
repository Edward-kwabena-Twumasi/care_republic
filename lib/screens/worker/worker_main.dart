import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/custom_theme.dart';
import 'barber_profile_screen.dart';
import 'barber_tasks_screen.dart';



class WorkerMainScreen extends StatefulWidget {
  const WorkerMainScreen({Key? key}) : super(key: key);

  @override
  _WorkerMainScreenState createState() => _WorkerMainScreenState();
}

class _WorkerMainScreenState extends State<WorkerMainScreen> {
  Map<String, dynamic> barber = {};
  late StreamSubscription barberSubscription;

   @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    barberSubscription.cancel();
  }


  int index = 0;
  List<Widget> pages = [
    BarberAboutScreen(),
    BarberTaskScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WorkerDrawer(barber: barber),

       
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.white,
           
            currentIndex: index,
            // onTap:provider(listen: true)
            //                   .networkStatus
            //                   .toString()
            //                   .split(".")[1] ==
            //               "offline"
            //           ? (nindex) {
            //               setState(() {
            //                 index = nindex;
            //                 //index > 0 ? showsearch = false : showsearch = true;
            //               });
            //             }
            //           : (newindex) {
            //   setState(() {
            //     index = newindex;
            //     //index > 0 ? showsearch = false : showsearch = true;
            //   });
            // },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.watch), label: "Timeline"),
            ]),
         body:
        // provider(listen:true).networkStatus.toString().split(".")[1]=="offline"?
        //
        //  SafeArea(child: NetworkErrorScreen(context:context,onRefresh: (){
        //     setState(() {
        //       print("On refresh");
        //        print(index.toString());
        //     });
        //   })):
       SafeArea(child: pages.elementAt(index)));
  }
}

class WorkerDrawer extends StatelessWidget {
  const WorkerDrawer({
    Key? key,
    required this.barber,
  }) : super(key: key);

  final Map<String, dynamic> barber;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.center,
          children:[

          Container(
            height:150,
            decoration:BoxDecoration(
              color:colorScheme.onPrimary
              // borderRadius: BorderRadius.only(
              //   bottomRight:Radius.circular(10)
              // )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:40.0),
              child: ListTile(

                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(barber["name"]??"...", style:textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(barber["email"]??"...", style:textTheme.caption)
                )
                ,
                trailing:IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                ),
            ),
          ),
           Divider(
             indent: 30,
             endIndent: 30,
             thickness: 2,
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(onTap: (){

              }, title: Text("Account",style: TextStyle(fontWeight: FontWeight.bold ),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(onTap: (){

              }, title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold ),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(onTap: (){

              }, title: Text("Messages",style: TextStyle(fontWeight: FontWeight.bold ),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(onTap: (){
                 // Navigator.push(context,
                 //          MaterialPageRoute(builder: (builder) {
                 //        return ShareApp();
                 //      }));
              }, title: Text("Share",style: TextStyle(fontWeight: FontWeight.bold ),)),
            ),
            Spacer(),
             ListTile(
            title: TextButton(
                onPressed: () {
                  // Provider.of<ApplicationProvider>(context, listen: false)
                  //     .signOut();
                  // Navigator.pushAndRemoveUntil(context,
                  //     MaterialPageRoute(builder: (builder) {
                  //   return SignInOptionScreen();
                  // }), (route) => false);
                  //go back to sign in
                },
                child: Text("Sign Out")),
          ),
          ]
        ),
      ),
    );
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


 