import 'package:flutter/material.dart';



class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);


 
  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  
  @override
  Widget build(BuildContext context) {
return SafeArea(
  child:   Scaffold(
  appBar: AppBar(
    title: Text("OTP verification"),
  ),
    body:   Column(
  
      mainAxisAlignment: MainAxisAlignment.start,
  
      children: [
  
    SizedBox(
  
      height: 30,
  
    ),
  
        Padding(
  padding: EdgeInsets.all(5),
          child: Text("""Verify phone number""",
  textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
  
        ),
  
    SizedBox(
  
      height: 10,
  
    ),
  
        Padding(
  padding: EdgeInsets.all(5),
  
           child: Text("Enter OTP code here.",
     textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17)),
  
         ),
  
    SizedBox(
  
      height: 50,
  
    ),
  
         Center(
  
           child: SizedBox(
  
             width: MediaQuery.of(context).size.width*0.95,
  
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [CircleAvatar(
               radius: 24,
               backgroundColor: Color.fromARGB(42, 51, 49, 49),
             ),
             CircleAvatar(
               radius: 24,
               backgroundColor: Color.fromARGB(42, 51, 49, 49),
             ),
             CircleAvatar(
               radius: 24,
               backgroundColor: Color.fromARGB(42, 51, 49, 49),
             ),
             CircleAvatar(
               radius: 24,
               backgroundColor: Color.fromARGB(42, 51, 49, 49),
             )
             ],
           )
  
         )),
  
    SizedBox(
  
      height: 10,
  
    ),
     Padding(
  padding: EdgeInsets.all(5),
  
           child: Text("Enter OTP code here.",
     textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
  
         ),
  
    SizedBox(
  
      height: 5,
  
    ),
       
           Center(
  
           child: SizedBox(
  height: 50,
             width: MediaQuery.of(context).size.width*0.95,
  
             child: ElevatedButton(
  
               style: ElevatedButton.styleFrom(
  elevation: 0,
                primary: Colors.white ,
               
  
               ),
  
               onPressed: (){}, child:  Text("SEND NEW CODE",style:  TextStyle(
                  color: Color(0xFFDA285E)
                ),))),
  
         )
  
    
  
      ],
  
    
  
    ),
  
  ),
) ;   
  }
}
