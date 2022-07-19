import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:thecut/generator/common_user_info_retriever.dart';
import 'package:thecut/generator/id_generator.dart';
import 'package:thecut/generator/sign_in_profile_generator.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/orientation/worker_registration_screen.dart';
import 'package:thecut/screens/worker/auth/auth_linker_screen.dart';
import 'package:thecut/screens/worker/worker_main_screen.dart';

class OTPReceptionScreen extends StatefulWidget {
  final String authType;
  final String source;
  final String phone;

  const OTPReceptionScreen(
      {Key? key,
      required this.authType,
      required this.phone,
      this.source = 'worker'})
      : super(key: key);

  @override
  State<OTPReceptionScreen> createState() => _OTPReceptionScreenState();
}

class _OTPReceptionScreenState extends State<OTPReceptionScreen> {
  int timeOut = 90;
  int maxTime = 90;
  Timer? timer;
  String OTPCODE = '';

  Map<String, dynamic> matchingAccount = {
    'uid': '',
    'active_id': "",
    "_ids": [],
    "phone": ""
  };

  double profileListWidgetHeight = 20;

  Future<Response> sendOTPMessage() {
    String key = "r9jA24VeRyEvxLtjY82wfqJyl";
    String? to = widget.phone;
    setState(() {
      OTPCODE = Random().nextInt(9999).toString().padLeft(4,'0');
      print(OTPCODE);
    });
    String msg = "Your OTP Message is $OTPCODE";
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
  Future<String> sendDummyOTPMessage() {
    String key = "r9jA24VeRyEvxLtjY82wfqJyl";
    String? to = widget.phone;
    setState(() {
      OTPCODE = Random().nextInt(9999).toString().padLeft(4,'0');
      print(OTPCODE);
    });
    String msg = "Your OTP Message is $OTPCODE";
    String sender_id = "CUTZ";
    //https://apps.mnotify.net/smsapi?key=xxxxxxxxxx&to=xxxxxxx&msg=xxxxxxxx&sender_id=xxxxx

    return Future.value(OTPCODE);
  }

  @override
  initState() {
    super.initState();

    /*sendOTPMessage().then((value) {
      print("OTP Message Sent Successfully");
    });*/

    sendDummyOTPMessage().then((value) => print(value));

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        timeOut -= 1;
        if (timeOut == 0) {
          timer?.cancel();
        }
      });
    });
  }

  updateTimer() {
    if (mounted)
      setState(() {
        maxTime = maxTime * 2;
        timeOut = maxTime;
      });
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        timeOut -= 1;
        if (timeOut == 0) {
          timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(hasAppBar: false, hasBottomNav: false, context: context);

    BoxDecoration _pinPutDecoration() {
      return BoxDecoration(
        border: Border.all(color: Colors.deepPurpleAccent),
        borderRadius: BorderRadius.circular(15.0),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.ch(20),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Verify phone number",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                  "We have sent an OTP to you phone, Do enter it to verify your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 13.sp)),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.cw(20)),
              child: PinPut(
                fieldsCount: 4,
                submittedFieldDecoration: _pinPutDecoration().copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selectedFieldDecoration: _pinPutDecoration(),
                followingFieldDecoration: _pinPutDecoration().copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.deepPurpleAccent.withOpacity(.5),
                    )),
                onSubmit: (pin) {
                  if (pin.compareTo(OTPCODE) == 0) {
                    provider(context).setActivePhone(widget.phone);
                    provider(context)
                        .registeredUsers(widget.phone)
                        .then((QuerySnapshot<Map<String, dynamic>> events) {
                      if (events.docs.isNotEmpty) {
                        /*
          *  A check to see whether the user logging in is a registered user
           */

                        if (mounted) {
                          /*
            * A check to verify whehter the widget is still mounted or disposed
            * Before Setting State
            */
                          setState(() {
                            matchingAccount = events.docs[0].data();
                            profileListWidgetHeight = size.ch(15 +
                                (profileGenerator(matchingAccount['_ids'], context).length *
                                    8));
                          });
                        }

                        print(
                            "===================Before Checking Block=====================");
                        print("||${matchingAccount['_ids']}||");
                        print(
                            "===================End of Before Checker Block===============");
                        /*
                         *  Next Block Describes the Instance a person registered on the System tries to Sign up or Login
                         * Initially, there there was an if block but has been removed because there was
                         * no point using signin and signup clause
                         *
                         * The UI having Create Account is just to please viewers
                         */

                        /*  if (widget.authType == 'signin') {*/
                        /*
                           * A user tries to sign in to the system after being idenfited as an old user of the system
                           */
                        provider(context, type: 'worker')
                            .registeredStream(matchingAccount['uid'])
                            .then((clientEvents) {
                          if (clientEvents.docs.isNotEmpty) {
                            /*
                * This If clause above is entered when the account trying to login, is a member of the clients Collection
                * Or the person has a shop account
                 */
                            String matchingUID = matchingAccount['uid'];
                            print("Matching ID $matchingUID");
                            String idByRole =
                            getIdByRole(matchingUID, widget.source.toLowerCase());
                            print("Role ID $idByRole");
                            if (matchingAccount['_ids'].contains(idByRole)) {
                              /*
                  * When the Pathway or source the person chose matches the one He already has on the system, he/she is routed
                  * to the Shop Main screen with the exact ID
                  */
                              print(widget.source);
                              print(matchingAccount['_ids']);
                              print(getIdByRole(matchingAccount['uid'], widget.source));
                              //Route the user to Shop Main Screen because he is a shop and has matching ID
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (_) {
                                    return WorkerMainScreen();
                                  }), (route) => false);
                            }
                          } else {
                            /*
                              *
                              * User tries to register as a shop but is identified as either a user or a worker
                              * His details in their original profiles are transferred to the SHOP REGISTRATION PAGE
                              *
                              */
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)),
                                    //this right here
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.cw(3), vertical: size.ch(5)),
                                      child: SizedBox(
                                        height: profileListWidgetHeight,
                                        child: OverflowBox(
                                          alignment: Alignment.center,
                                          maxHeight: profileListWidgetHeight,
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
                                                    matchingAccount['_ids'], context)
                                              ],
                                            ),
                                            // const Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                    'Upgrade to [${widget.source}] profile?'),
                                                TextButton(
                                                    onPressed: () {

                                                      getUserInformation(matchingAccount).then((value){
                                                        Map<String,dynamic> firstUserAccount=value.data()!;
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                                                          return WorkerRegistrationScreen(prevDetails: {
                                                            'fname':firstUserAccount['fname'],
                                                            'sname':firstUserAccount['sname'],
                                                            'email':firstUserAccount['email'],
                                                            'phone':firstUserAccount['phone']
                                                          },);
                                                        }));

                                                      });

                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (BuildContext context) {
                                                            return Dialog(
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10.0)),
                                                              //this right here
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsets.symmetric(
                                                                    horizontal:
                                                                    size.cw(3),
                                                                    vertical:
                                                                    size.ch(5)),
                                                                child: SizedBox(
                                                                  height:
                                                                  profileListWidgetHeight,
                                                                  child: OverflowBox(
                                                                    alignment:
                                                                    Alignment.center,
                                                                    maxHeight:
                                                                    profileListWidgetHeight,
                                                                    child: Column(
                                                                        children: [
                                                                          Padding(
                                                                              padding: EdgeInsets.all(
                                                                                  size.ch(
                                                                                      1)),
                                                                              child: Text(
                                                                                'Transitioning',
                                                                                style: TextStyle(
                                                                                    fontSize: 14
                                                                                        .sp,
                                                                                    fontWeight:
                                                                                    FontWeight.bold),
                                                                              )),
                                                                          Text(
                                                                            "You're getting upgraded : Feature ${widget.source.toUpperCase()}",
                                                                            textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                11.sp),
                                                                          ),
                                                                          Column(
                                                                            children: const [
                                                                              SpinKitChasingDots(
                                                                                color: Colors
                                                                                    .orange,
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ]),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });




                                                      /*  provider(context)
                                            .collection()
                                            .doc(matchingAccount['uid'])
                                            .update({
                                          '_ids': FieldValue.arrayUnion([
                                            getIdByRole(
                                                matchingAccount['uid'],
                                                widget.source)
                                          ])
                                        }).then((_) {
                                          provider(context, type: 'shop')
                                              .collection()
                                              .doc(matchingAccount['uid'])
                                              .update({
                                            'types': FieldValue.arrayUnion(
                                                [widget.source])
                                          }).then((value){
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (_) {

                                                  return ClientRegistrationScreen();
                                                }));

                                        });
                                      });*/

                                                    },
                                                    child: const Text('Upgrade'))
                                              ],
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                  );
                                });

                            print("Valid Product User");
                            print("Cannot Login As Client Because of Details");
                            print("You are either a Shop or Worker");
                          }
                        });
                      } else {
                        print("Non-existent Account");
                        Navigator.push(context, MaterialPageRoute(builder: (builder) {
                          return WorkerRegistrationScreen();
                        }));
                      }
                      //  print(events.docs);
                    });



                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('You missed some digits in the pin'),
                      action: SnackBarAction(
                          label: 'Resend',
                          onPressed: () {
                           // sendOTPMessage().then((value) => print(value));
                            sendDummyOTPMessage().then((value) => print(value));

                          }),
                    ));
                  }
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
                child: timeOut == 0
                    ? Column(children: [
                        const Text("Didn't get any code?"),
                        TextButton(
                          onPressed: updateTimer,
                          child: const Text("SEND NEW CODE",
                              style: TextStyle(
                                color: Color(0xFFDA285E),
                              )),
                        ),
                      ])
                    : Text(
                        "${(timeOut ~/ 60).toString().padLeft(2, '0')}:${(timeOut % 60).toInt().toString().padLeft(2, '0')}"))
          ],
        ),
      ),
    );
  }
}
