import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:overlapping_time/overlapping_time.dart';
import 'package:thecut/screens/shop/shop_main_screen.dart';

class Endorse extends StatefulWidget {
  const Endorse({Key? key, required this.aptId, required this.appointment})
      : super(key: key);
  final String aptId;
  final Map<String, dynamic> appointment;

  @override
  _EndorseState createState() => _EndorseState();
}

class _EndorseState extends State<Endorse> {
  List<Map<String, dynamic>> aptsToday = [];
  late StreamSubscription appointmentsSubscription;

  late StreamSubscription barberSubscription;
  int exclusive = -1;
  Map<String, dynamic> selectedBarber = {};

  // List<Map<String, dynamic>> barbers = [];
  List<DateTimeRange> timeRanges = [];
  List<String> busyBarbers = ["000"];
  Stream<QuerySnapshot<Map<String, dynamic>>> barbersAvailableStream =
      Stream.empty();

  DateTimeRange dtRange(Map<String, dynamic> data) {
    return DateTimeRange(
        start: data["date"],
        end: data["date"]

            .add(Duration(minutes: int.parse(data["duration"].toString()))));
  }

  void findBusyBarbers(
      Map<String, dynamic> incoming, Map<String, dynamic> confirmed) {
    List<DateTimeRange> ranges = [dtRange(incoming), dtRange(confirmed)];
    print(ranges);
    final Map<int, List<ComparingResult>> searchResults =
        findOverlap(ranges: ranges);

    if (searchResults[2]!.isEmpty) {
      print('Appointment Possible');
    } else {
      print('Duration Occupied, Barber Booked');
      setState(() {
        busyBarbers.add(confirmed["barber_id"]);
      });
      print(busyBarbers);
    }
  }

  Future<Response> sendAcceptanceMessage() {
    return post(
      Uri.parse(
          'https://api.mnotify.com/api/sms/quick?key=uKu8cgb2bPkkeOlsKfwNdn8OWYtA1WwwG1EThQWtFgNT5'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "recipient": [widget.appointment['client_id'].toString(), "0501651045"],
        "sender": "CUTZ",
        "message":
            "APPOINTMENT COMPLETED: Appointment Scheduled for ${DateFormat(' dd MMM. yyyy, EEE   hh:mm aaa').format(widget.appointment['date']).toString()} with ${widget.appointment['shop_name']} has been confirmed",
        "is_schedule": false,
        "schedule_date": ""
      }),
    );
  }

  Future<Response> sendAcceptanceMessageNow() {
    String key = "uKu8cgb2bPkkeOlsKfwNdn8OWYtA1WwwG1EThQWtFgNT5";
    String to = widget.appointment['client_id'];
    String msg =
        "APPOINTMENT COMPLETED: Appointment Scheduled for ${DateFormat(' dd MMM. yyyy, EEE   hh:mm aaa').format(widget.appointment['date']).toString()} with ${widget.appointment['shop_name']} has been confirmed";
    String sender_id = "CUTZ";

    return post(
      Uri.parse(
          'https://api.mnotify.com/api/sms/quick?key=uKu8cgb2bPkkeOlsKfwNdn8OWYtA1WwwG1EThQWtFgNT5'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "recipient": ["0501651045", "0552489602", to],
        "sender": sender_id,
        "message": msg,
        "is_schedule": false,
        "schedule_date": ""
      }),
    );
  }

  Future<Response> sendDeclinationMessageNow() {
    String key = "uKu8cgb2bPkkeOlsKfwNdn8OWYtA1WwwG1EThQWtFgNT5";
    String to = widget.appointment['client_id'];
    String msg =
        "APPOINTMENT DECLINED: Appointment Scheduled for ${DateFormat(' dd MMM. yyyy, EEE   hh:mm aaa').format(widget.appointment['date']).toString()} with ${widget.appointment['shop_name']} has been DECLINED FOR AVAILABILITY reasons";
    String sender_id = "CUTZ";

    return post(
      Uri.parse(
          'https://api.mnotify.com/api/sms/quick?key=uKu8cgb2bPkkeOlsKfwNdn8OWYtA1WwwG1EThQWtFgNT5'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "recipient": ["0501651045", "0552489602", to],
        "sender": sender_id,
        "message": msg,
        "is_schedule": false,
        "schedule_date": ""
      }),
    );
  }



  Future<Response> sendAcceptanceMessage2() {
    String key = "r9jA24VeRyEvxLtjY82wfqJyl";
    String? to = "";//provider().phoneNumber;
    String msg =
        "APPOINTMENT CONFIRMATION: Appointment Scheduled for ${DateFormat(' dd MMM. yyyy, EEE   hh:mm aaa').format(widget.appointment['date']).toString()} with ${widget.appointment['shop_name']} has been confirmed";
    String sender_id = "CUTZ";
    //https://apps.mnotify.net/smsapi?key=xxxxxxxxxx&to=xxxxxxx&msg=xxxxxxxx&sender_id=xxxxx

    return get(
      Uri.parse(
          "https://apps.mnotify.net/smsapi?key=$key&to=$to&msg=$msg&sender_id=$sender_id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );
  }
int selected=-1;
  Map<String,dynamic> selectedSpecialist={};
  //bool searching=false;
  @override
  void initState() {
    super.initState();

    DateTime appointmentDate = widget.appointment['date'];

  }

  @override
  void dispose() {
    super.dispose();
    //appointmentsSubscription.cancel();
    //barberSubscription.cancel();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
    persistentFooterButtons: [
      ActionButtons()
    ],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            automaticallyImplyLeading: true,
            title: Text("Confirm appointment"),
            centerTitle: true,
          ),
          SummaryInfo(appointment: widget.appointment),
          //dummy code fot checking time overlap

          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Shop Specialists",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),

Expanded(
  child:   Padding(
    padding: const EdgeInsets.only(left: 5.0,top: 4,right: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        ),
        border: Border.all(color: Colors.black12)
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: 7,
          itemBuilder: (context,i)=>GestureDetector(
              onTap: (){
                setState(() {
                  selected==i?selected=-1:selected=i;
                });              },
              child: SpecialistCard(specialist: {"name":"Joel","tasks":"8"},selected:selected==i?true:false))),
    ),
  ),
),


        ],
      ),
    );
  }
}
class SpecialistCard extends StatelessWidget {
  const SpecialistCard({
    Key? key, required this.specialist,
    required this.selected
  }) : super(key: key);
  final Map<String,dynamic> specialist;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    Color badgeColor=Colors.blue;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        selected: selected,
        selectedTileColor: Colors.black12,
        leading: CircleAvatar(
          radius: 30,
        ),
        title: Text(specialist["name"]),
        subtitle: Text( specialist['tasks'].toString()+" tasks left"),
        trailing:  Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
                color:badgeColor.withOpacity(0.2),
                borderRadius:BorderRadius.circular(20)
            ),
            child: Text("Select",style: TextStyle(color: badgeColor),)),
      ),
    );
  }
}
class SummaryInfo extends StatelessWidget {
  const SummaryInfo({Key? key, required this.appointment}) : super(key: key);
  final Map<String,dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                  "${appointment['client_name']}'s appointment details",
                  style: TextStyle(
                    //color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                  )),

            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
             decoration: BoxDecoration(
               color: Colors.grey.withOpacity(0.2),
               borderRadius: BorderRadius.circular(10)
             ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                Text("On",style: TextStyle(fontWeight: FontWeight.w500),),
                Text( DateFormat(' dd MMM. yyyy,    hh:mm aaa')
                    .format(appointment["date"]),style: TextStyle(fontWeight: FontWeight.w300))
              ],),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Duration of ",style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('${appointment["duration"]} mins',style: TextStyle(fontWeight: FontWeight.w300))
                  ],),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Assigned barber . ",style: TextStyle(fontWeight: FontWeight.w500)),
                    Text("None yet",style: TextStyle(fontWeight: FontWeight.w300))
                  ],),
                SizedBox(
                  height: 7,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Bottom buttons
class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            onPressed: () {

            },
            child: Text("Accept"),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    top: 5, bottom: 5, left: 25, right: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.green,
                textStyle: TextStyle(color: Colors.white))),
        ElevatedButton(
            onPressed: () {

            },
            child: Text(
              "Decline",
              style: TextStyle(color: Colors.blue),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.grey[200],
                textStyle: TextStyle(color: Colors.blue))),
      ],
    );
  }
}


