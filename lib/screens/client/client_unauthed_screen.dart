import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/client/auth/phone_entry_screen.dart';
import 'package:thecut/screens/client/client_registration_screen.dart';

class ClientUnAuthedScreen extends StatefulWidget {
  const ClientUnAuthedScreen({Key? key}) : super(key: key);

  @override
  _ClientUnAuthedScreenState createState() => _ClientUnAuthedScreenState();
}

class _ClientUnAuthedScreenState extends State<ClientUnAuthedScreen> {
  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasAppBar: false, hasBottomNav: true);
    return Container(
      width: size.cw(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(size.cw(4)),
            child: Text("Log in/ Sign up to access your favourite shops",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp)),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDA285E),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.cw(5), vertical: size.cw(2))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) {
                  return const ClientPhoneEntryScreen(source: 'client',);
                }));
              },
              child: Text("Log in/ Sign up"))
        ],
      ),
    );
  }
}
