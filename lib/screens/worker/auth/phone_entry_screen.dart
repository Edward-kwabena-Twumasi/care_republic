import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:thecut/generator/sign_in_profile_generator.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/worker/auth/otp_reception_screen.dart';

class WorkerPhoneEntryScreen extends StatefulWidget {
  final String source;
  final String authType;

  const WorkerPhoneEntryScreen(
      {Key? key, required this.source, this.authType = 'signup'})
      : super(key: key);

  @override
  State<WorkerPhoneEntryScreen> createState() => _WorkerPhoneEntryScreenState();
}

class _WorkerPhoneEntryScreenState extends State<WorkerPhoneEntryScreen> {
  TextEditingController phoneCtrl = TextEditingController();
  Map<String, Map<String, dynamic>> authSystem = {
    'signup': {
      'switch_text': "Already have and account? Sign in",
      'welcome_text': "Create an account to find work around you"
    },
    'signin': {
      'switch_text': "Don't have an account yet? Create one",
      'welcome_text': "Log in to connect with clients and find work"
    }
  };

  String chosenAuth = 'signup';

  @override
  initState() {
    super.setState(() {
      chosenAuth = widget.authType;
    });
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(hasAppBar: false, hasBottomNav: false, context: context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.ch(10),
            ),
            Padding(
              padding: EdgeInsets.all(size.cw(1)),
              child: Text(
                authSystem[chosenAuth]!['welcome_text'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
            ),
            SizedBox(
              height: size.ch(2),
            ),
            Padding(
              padding: EdgeInsets.all(size.cw(2.5)),
              child: Text(
                  "Add phone number.An otp will be sent to your phone for verification.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 12.sp)),
            ),
            SizedBox(
              height: size.ch(5),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.all(size.cw(2)),
              child: TextField(
                controller: phoneCtrl,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    /*  fillColor: Color.fromARGB(42, 51, 49, 49),*/
                    hintText: "0XXXXXXXXXX",
                    label: Text('Phone number'),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    /* prefix: Text("+233 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFDA285E))),*/
                    suffixIcon: IconButton(
                        onPressed: phoneCtrl.text.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  phoneCtrl.text = "";
                                });
                              },
                        icon: Icon(Icons.close_sharp))),
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                  height: size.ch(7),
                  width: size.cw(95),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFDA285E)),
                      onPressed: () {
          /*              provider(context, type: 'app')
                            .registeredStream(phoneCtrl.text)
                            .then(
                                (QuerySnapshot<Map<String, dynamic>> events)  {
                          //List<Map<String,dynamic>> profiles=events.docs.data().toList();
                          // print(events.docs.map((e) => e.data()).toList());
                          List<Map<String, dynamic>>? profiles =  events.docs
                              .map((QueryDocumentSnapshot<Map<String, dynamic>>
                                      e) =>
                                  e.data())
                              .toList();
                          //print(profiles[0]['_ids']);
                          //profileGenerator(profiles[0]['_ids']);

                          int profileLength =
                              profileGenerator(profiles==null?[]:profiles[0]['_ids'],context).length;
                          double profileListWidgetHeight = size.ch(15 +
                              ((profileLength > 0 ? profileLength : 1) * 12.5));
                          //print(profiles.length * 5);

                          if (events.docs.isNotEmpty) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    //this right here
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.cw(3),
                                          vertical: size.ch(5)),
                                      height: profileListWidgetHeight,
                                      child: Column(children: [
                                        Padding(
                                            padding: EdgeInsets.all(size.ch(1)),
                                            child: Text(
                                              'Associated Profiles',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Text(
                                          'Your account is associated with the following profiles (Tap to sign in)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 11.sp),
                                        ),
                                        Column(
                                          children: [
                                            ...profileGenerator(
                                                profiles==null?[]:profiles[0]['_ids'],context)
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Proceed to sign up?'),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (builder) {
                                                    return OTPReceptionScreen(
                                                        source: widget.source,
                                                        authType:
                                                            widget.authType,
                                                        phone: phoneCtrl.text);
                                                  }));
                                                },
                                                child: const Text('Sign up'))
                                          ],
                                        )
                                      ]),
                                    ),
                                  );
                                });
                          } else {
                            print("Code Execution Here");*/
                            Navigator.push(context,
                                MaterialPageRoute(builder: (builder) {
                              return OTPReceptionScreen(
                                  source: widget.source,
                                  authType: widget.authType,
                                  phone: phoneCtrl.text);
                            }));
                         /* }
                          //  print(events.docs);
                        });*/

                        /* Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return OTPReceptionScreen(source: widget.source, authType: widget.authType,phone:phoneCtrl.text);
                        }));*/
                      },
                      child: const Text("SEND OTP"))),
            ),
            Spacer(),
            Center(
              child: TextButton(
                  onPressed: () {
                    String nextAuth = '';
                    if (chosenAuth == 'signup') {
                      nextAuth = 'signin';
                    } else {
                      nextAuth = 'signup';
                    }
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return WorkerPhoneEntryScreen(
                        source: 'worker',
                        authType: nextAuth,
                      );
                    }));
                  },
                  child: Text(
                    authSystem[chosenAuth]!['switch_text'],
                    style: const TextStyle(color: Color(0xFFDA285E)),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<Response> sendOTPMessage() {
    String key = "r9jA24VeRyEvxLtjY82wfqJyl";
    String? to = phoneCtrl.text;
    String msg = "Your OTP Message is 1234";
    String sender_id = "CUTZ";
    //https://apps.mnotify.net/smsapi?key=xxxxxxxxxx&to=xxxxxxx&msg=xxxxxxxx&sender_id=xxxxx

    return get(
      Uri.parse(
          "https://apps.mnotify.net/smsapi?key=$key&to=$to&msg=$msg&sender_id=$sender_id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      /* body: jsonEncode(<String, dynamic>{
        "recipient": [widget.appointment['client_id'].toString(), "0501651045"],
        "sender": "CUTZ",
        "message":
            "APPOINTMENT COMPLETED: Appointment Scheduled for ${DateFormat(' dd MMM. yyyy, EEE   hh:mm aaa').format(widget.appointment['date'].toDate()).toString()} with ${widget.appointment['shop_name']} has been confirmed",
        "is_schedule": false,
        "schedule_date": ""
      }),*/
    );
  }
}
