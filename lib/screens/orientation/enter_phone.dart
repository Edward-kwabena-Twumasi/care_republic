import 'package:flutter/material.dart';
import 'package:thecut/screens/orientation/otp.dart';

class enterPhoneNumber extends StatefulWidget {
  const enterPhoneNumber({Key? key}) : super(key: key);


 
  @override
  State<enterPhoneNumber> createState() => _enterPhoneNumberState();
}

class _enterPhoneNumberState extends State<enterPhoneNumber> {
  
  @override
  Widget build(BuildContext context) {
return SafeArea(
  child:   Scaffold(
  
    body:   Column(
  
      mainAxisAlignment: MainAxisAlignment.start,
  
      children: [
  
    SizedBox(
  
      height: 30,
  
    ),
  
        Padding(
  padding: EdgeInsets.all(5),
          child: Text("""SIgn up to start serving customers near you""",
  textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
  
        ),
  
    SizedBox(
  
      height: 10,
  
    ),
  
        Padding(
  padding: EdgeInsets.all(5),
  
           child: Text("Add phone number.An otp will be sent for verification.",
     textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17)),
  
         ),
  
    SizedBox(
  
      height: 50,
  
    ),
  
         Center(
  
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
  
  
               decoration: InputDecoration(
  
                fillColor: Color.fromARGB(42, 51, 49, 49),
                   filled: true,
                 hintText: "55 248 9602",
  
             border:OutlineInputBorder(borderSide: BorderSide.none) ,
  
                 prefix: Text("+233 ", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFDA285E))),
  
             
  
                 suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.close_sharp))

  
               ),
  
             
  
             ),
           )),
  
    SizedBox(
  
      height: 10,
  
    ),
  
         Center(
  
           child: SizedBox(
  height: 50,
             width: MediaQuery.of(context).size.width*0.95,
  
             child: ElevatedButton(
  
               style: ElevatedButton.styleFrom(
  
                primary: Color(0xFFDA285E) 
  
               ),
  
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (builder){
                   return OTP();
                 }));
               }, child:  Text("SEND OTP"))),
  
         ),
         Spacer(),
           Center(
  
           child: SizedBox(
  height: 50,
             width: MediaQuery.of(context).size.width*0.95,
  
             child: ElevatedButton(
  
               style: ElevatedButton.styleFrom(
  elevation: 0,
                primary: Colors.white ,
               
  
               ),
  
               onPressed: (){}, child:  Text("Already have and account? Sign in",style:  TextStyle(
                  color: Color(0xFFDA285E)
                ),))),
  
         )
  
    
  
      ],
  
    
  
    ),
  
  ),
) ;   
  }
}
