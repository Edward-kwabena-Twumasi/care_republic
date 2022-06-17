import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';


import '../../scaling/scaler.dart';

class OTPReceptionScreen extends StatefulWidget {
  const OTPReceptionScreen({Key? key}) : super(key: key);

  @override
  State<OTPReceptionScreen> createState() => _OTPReceptionScreenState();
}

class _OTPReceptionScreenState extends State<OTPReceptionScreen> {
  int timeOut = 30;
  int maxTime = 30;
  Timer? timer;

  @override
  initState() {
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.ch(20),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                """Verify phone number""",
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
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.cw(10)),
              child: PinPut(
                fieldsCount: 4,
                onSubmit: (pin) => print(pin),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
                child: timeOut == 0
                    ? Column(children: [
                        Text("Didn't get any code?"),
                        TextButton(
                          onPressed: updateTimer,
                          child: Text("SEND NEW CODE",
                              style: TextStyle(
                                color: Color(0xFFDA285E),
                              )),
                        ),
                      ])
                    : Text(
                        "${(timeOut / 60).toInt().toString().padLeft(2, '0')}:${(timeOut % 60).toInt().toString().padLeft(2, '0')}"))
          ],
        ),
      ),
    );
  }
}
