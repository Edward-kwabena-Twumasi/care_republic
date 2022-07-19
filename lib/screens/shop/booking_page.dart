import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

DateTime selectedtime = DateTime.now();

class BookAppointment extends StatefulWidget {
  // final String shopId;
  final List services;

  const BookAppointment(
      {Key? key, required this.services})
      : super(key: key);

  @override
  BookAppointmentState createState() => BookAppointmentState();
}

class BookAppointmentState extends State<BookAppointment> {
  bool selected = false;

  int total = 0;
  List servicechosen = [false, false, false];

  List<Map<String, dynamic>> prefServices = [];
  List<Map<String, dynamic>> services = [
    /* {"id": "service1", "price": 500, "name": 'Down Cut'},
    {"id": "service2", "price": 400, "name": 'Upper Cut'}*/
  ];

  //List<Appointment> listOfAppointments = <Appointment>[];
  TimeOfDay time =
  TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
  DateTime date = DateTime.now();
  //late StreamSubscription shopProductSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      // shopProductSubscription = FirebaseFirestore.instance
      //     .collection('shop_styles')
      //     .doc(widget.shopId)
      //     .collection('style')
      //     .snapshots()
      //     .listen((event) {
      //   setState(() {
      //     services = [];
      //   });
      //   print(event.docs.length);

      //   for (var style in event.docs) {
      //     //print(oldStyle.data().runtimeType);
      //     print('HERE');
      //     print(style.data());
      //     setState(() {
      //       services.add(style.data());
      //     });
      //   }
      // });
    });
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder()
            ),
            onPressed: (){}, child: Text("Proceed")),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          /*centerTitle: true,*/
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text("Book Appointment",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/nicesalon.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.centerRight)),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(color: Colors.black45)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 11, bottom: 4, top: 8),
                      child: Text(
                        'Select time for appointment',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Card(
                        elevation: 1,
                        color: Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                                  DateFormat(' dd MMM. yyyy, EEE   hh:mm aaa')
                                      .format(date),
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                )),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              color: Colors.green,
                              onPressed: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate:
                                    DateTime(DateTime.now().year + 100))
                                    .then((chosenDate) {
                                  setState(() {
                                    date = chosenDate != null
                                        ? DateTime(
                                        chosenDate.year,
                                        chosenDate.month,
                                        chosenDate.day,
                                        time.hour,
                                        time.minute)
                                        : date;
                                  });
                                  //print(chosenDate.toString());
                                });
                              },
                            ),
                            IconButton(
                              color: Colors.orange,
                              onPressed: () {
                                showTimePicker(
                                    context: context, initialTime: time)
                                    .then((chosenTime) {
                                  setState(() {
                                    time = chosenTime ?? time;
                                    //
                                    displayOldTimeError();
                                    //

                                    date = DateTime(date.year, date.month,
                                        date.day, time.hour, time.minute);

                                    displayInvalidTimeError(date);

                                    print(date.toString());
                                    print(chosenTime.toString());
                                  });
                                });
                              },
                              icon: Icon(Icons.access_time),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 11, bottom: 4, top: 8),
                      child: Text(
                        'Services summary',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ListView.builder(

                          padding: EdgeInsets.only(top:10),
                          shrinkWrap: true,
                          itemCount: widget.services.length,
                          itemBuilder: ((context, index) =>
                              Card(

                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                  child:ListTile(
                                      //tileColor: Colors.grey,
                                      title: Text(widget.services[index]["name"]))
                              )
                          )),
                    )


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void displayOldTimeError() {
    if (toDouble(TimeOfDay.now()) > toDouble(time)) {
      time = TimeOfDay.now();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('You must not choose time in the past')));
      return;
    }
  }

  updatePreServices(bool selected, Map<String, dynamic> service) {
    if (selected) {
      setState(() {
        prefServices.add(service);
      });
    } else {
      setState(() {
        prefServices.remove(service);
      });
    }
    print(prefServices);
    /*}else{
      print('Outside Condition');
      print(prefServices);
    }*/
  }

  void displayInvalidTimeError(DateTime dateSelected) {
    if ((DateTime.now().difference(dateSelected).inMinutes).abs() < 6) {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          padding: EdgeInsets.all(4),
          backgroundColor: Colors.black.withOpacity(0.90),
          content: const ListTile(
              title: Text(
                'Least time: 10 mins from now',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white60),
              ),
              subtitle: Text(
                "To cater for processing and notification",
                style: TextStyle(color: Colors.white54),
              )),
          actions: [
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                icon: Icon(Icons.close))
          ]));
    }
  }
}
