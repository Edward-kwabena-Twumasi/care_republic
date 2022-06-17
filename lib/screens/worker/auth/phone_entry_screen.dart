import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/worker/auth/otp_reception_screen.dart';

class WorkerPhoneEntryScreen extends StatefulWidget {
  final String source;
  final String authType;

  const WorkerPhoneEntryScreen({Key? key, required this.source, this.authType='signup'}) : super(key: key);
  @override
  State<WorkerPhoneEntryScreen> createState() => _WorkerPhoneEntryScreenState();
}

class _WorkerPhoneEntryScreenState extends State<WorkerPhoneEntryScreen> {

  TextEditingController phoneCtrl=TextEditingController();
  Map<String,Map<String,dynamic>> authSystem={
    'signup':{'switch_text':"Already have and account? Sign in",
              'welcome_text':"Create an account to find work around you"},
    'signin':{'switch_text':"Don't have an account yet? Create one",
      'welcome_text':"Log in to connect with clients and find work"}
  };

  String chosenAuth='signup';

  @override
  initState(){
    super.setState(() {
      chosenAuth=widget.authType;
    });
  }

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
              child: Text(authSystem[chosenAuth]!['welcome_text'],
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
                          return  OTPReceptionScreen(authType: chosenAuth,);
                        }));
                      },
                      child: Text("SEND OTP"))),
            ),
            Spacer(),
            Center(
              child: TextButton(
                  onPressed: () {
                    String nextAuth='';
                    if(chosenAuth=='signup'){
                     nextAuth='signin';
                    }else{
                      nextAuth='signup';
                    }
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                      return WorkerPhoneEntryScreen(source: 'worker',authType: nextAuth,);
                    }));
                  },
                  child:  Text(
                    authSystem[chosenAuth]!['switch_text'],
                    style: TextStyle(color: Color(0xFFDA285E)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
