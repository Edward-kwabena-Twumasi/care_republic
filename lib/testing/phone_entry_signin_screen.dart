import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../scaling/scaler.dart';
import '../screens/orientation/otp_reception_screen.dart';

class SignInPhoneEntryScreen extends StatefulWidget {
  const SignInPhoneEntryScreen({Key? key}) : super(key: key);

  @override
  _SignInPhoneEntryScreenState createState() => _SignInPhoneEntryScreenState();
}

class _SignInPhoneEntryScreenState extends State<SignInPhoneEntryScreen> {
  TextEditingController phoneCtrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Sizer size=Sizer(hasAppBar: false, hasBottomNav: false, context: context);
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
              child: Text("Sign up to start serving customers near you",
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
                  style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp)),
            ),
            SizedBox(
              height: size.ch(5),
            ),
            Center(
                child: Padding(
                  padding:  EdgeInsets.all(size.cw(2)),
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
                            onPressed: phoneCtrl.text.isEmpty?null:(){
                              setState(() {
                                phoneCtrl.text="";
                              });
                            }, icon: Icon(Icons.close_sharp))),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                              return const OTPReceptionScreen();
                            }));
                      },
                      child: Text("SEND OTP"))),
            ),
            Spacer(),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "No account yet? Create one",
                    style: TextStyle(color: Color(0xFFDA285E)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
