import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<Map<String, dynamic>> appointments = [
    {
      "client_name":"Joe",
      "date":DateTime.now(),
    },
    {
      "client_name":"Biden",
      "date":DateTime.now(),
    },
    {
      "client_name":"Putin",
      "date":DateTime.now(),
    }
  ];

  //late StreamSubscription appointmentsSubscription;
  
  void initState() {
    super.initState();
      setState(() {
     
    });

    // startTimer();
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();

   // appointmentsSubscription.cancel();
  }



  @override
  Widget build(BuildContext context) {
    return
      Column(

        children: [
          AppBar(
            title: Text("Appointments"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pending Requests',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          (appointments.length > 0)
              ? Container(
            height: 155,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: appointments.length,
                itemBuilder: (context, i) =>RequestCard(appointment: appointments[i])

            ),
          )
              : Text('No Request Pending'),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Confirmed Appointments',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

          ),
          Expanded(
            child: ListView(
             // crossAxisAlignment: CrossAxisAlignment.start,
              //shrinkWrap: true,
              children: [
                ListTile(
                  leading: CircleAvatar(),
                      title: Text("Eddie"),
                  subtitle: Text("Coming at 7am"),
                  trailing: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green)
                      ),
                      child: Text("Paid")),
                ),
                ListTile(
                  leading: CircleAvatar(),
                  title: Text("Prince Edward"),
                  subtitle: Text("Coming at 7am"),
                  trailing: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)
                      ),
                      child: Text("Unpaid")),
                )
              ],
            ),
          ),


        ],
      );
  }}



class RequestCard extends StatelessWidget {
  const RequestCard({
    Key? key, required this.appointment
  }) : super(key: key);

final Map<String,dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: MediaQuery.of(context).size.width *0.7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.clock, color: Colors.white),
                title: Text(
                    DateFormat(' dd MMM. yyyy,    hh:mm aaa')
                        .format(appointment["date"]),
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(

                  title: Text(appointment["client_name"]),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.info, color: Colors.blue)),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child:
                    ButtonBar(alignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Accept"),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          shape:StadiumBorder(),
                          primary: Colors.blue)),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Decline",
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          shape:StadiumBorder(),
                          primary: Colors.grey[200]
                      )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

