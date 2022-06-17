import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/orientation/shop_registration_screen.dart';



class OTPReceptionScreen extends StatefulWidget {
  final String authType;
  final String source;
  const OTPReceptionScreen({Key? key,  required this.authType, required this.source}) : super(key: key);

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

    final FocusNode _pinPutFocusNode = FocusNode();


    final TextEditingController _pinPutController = TextEditingController();

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
            Padding(
              padding: EdgeInsets.all(5),
              child: Text("Verify phone number",
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
              padding: EdgeInsets.symmetric(horizontal:size.cw(20)),
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
                 onSubmit : (pin){
                  print('2. On Submitted Called');
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                    if(widget.authType=='signin'){
                      return Scaffold(
                          appBar: AppBar(title: Text('Success Screen'),),
                          body:Center(child: Container(child: Text('Signed in Successfully'),)));
                    }else{
                      return const ShopRegistrationScreen();
                    }

                  }), (route) => false);
                   /* Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                      return const AuthLinkerScreen();
                    }), (route) => false);*/
                  },
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
                        "${(timeOut ~/ 60).toString().padLeft(2, '0')}:${(timeOut % 60).toInt().toString().padLeft(2, '0')}"))
          ],
        ),
      ),
    );
  }
}
