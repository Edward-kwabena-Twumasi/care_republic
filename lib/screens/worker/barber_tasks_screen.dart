import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thecut/theme/custom_theme.dart';


class BarberTaskScreen extends StatefulWidget {
  const BarberTaskScreen({Key? key}) : super(key: key);

  @override
  _BarberTaskScreenState createState() => _BarberTaskScreenState();
}

class _BarberTaskScreenState extends State<BarberTaskScreen> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> barberApts = [];

  //late StreamSubscription barberAptsSubscription;


  void initState() {
    super.initState();


  }
  @override
  void dispose(){
    super.dispose();
   // barberAptsSubscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          //backgroundColor: Colors.black.withOpacity(0.8),
          elevation:0.0,
          title: Text("Timeline"),
          
        leading: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                         
                        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
        
    
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Timeline",style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
               TextButton(onPressed: (){}, child: Text("See all"))
            ],
          ),
        ),
      Expanded(
        child: Stack(
          children:[
    
          Positioned(
            top: 35,
            left:20 ,
            child: Container(
            width: 2,
            height: MediaQuery.of(context).size.height-110,
             decoration:BoxDecoration(
                color:Colors.black54,
    
              ),
          )),
          Positioned(
    
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child:
                barberApts.length>0? ListView.builder(
                  shrinkWrap: true,
                  itemCount:barberApts.length,
                  itemBuilder: (Buildcontext,index){
                return TimeLine(barberApts[index].data()["client_name"], barberApts[index].data()["date"].toDate().toString(),context);
              }
              ):Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text("No tasks to perform",style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),),
                  Text("No appointmens assigned to you",style: textTheme.caption)
                ],
              ),
    
            ),
          ),
            Positioned(
              left: 5,
              top: 0,
              child: Container(
                  height:40,
                  width:30,
                  decoration:BoxDecoration(
                      color:Colors.black,
                      borderRadius:BorderRadius.circular(10)
                  ),
                  child:Center(child: Text(barberApts.length.toString(),style:TextStyle(color:Colors.white)))
              ),
            ),
    
          ]),
      ),
       
    
      ]),
    );
  }
}

Widget TimeLine(String time,String name,BuildContext context ) {
  return Container(
    padding: EdgeInsets.symmetric(
     horizontal:3,
     vertical:15
    ),
    decoration: BoxDecoration(
     
     boxShadow:[
        BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset.fromDirection(2.0))
     ]
    ),
    child: Row(children: [
                      Container(
                        padding:EdgeInsets.symmetric(vertical:10,horizontal:0),
                        height:17,
                        width:17,
                        decoration:BoxDecoration(
                          shape:BoxShape.circle,
 color:Colors.black.withOpacity(0.7)
                        )
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        height:1,
                        width:26,
                        decoration:BoxDecoration(
 color:Colors.black.withOpacity(0.4)
                        )
                      ),
                     Expanded(
                       child: Card(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8)
                         ),
                         elevation: 5.0,
                         child: Container(
                           padding:EdgeInsets.only(
                             left: 9,
                             bottom: 10,
                             top: 4

                           ),
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:Colors.white.withOpacity(0.2),

                          ),
                           //width: MediaQuery.of(context).size.width-100,
                           child: ListTile(
                              contentPadding: EdgeInsets.zero,
                            title: Text(name),
                            subtitle: Text(time)
                           ),
                         ),
                       ),
                     )
                     //TextSpan(text: date,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight:FontWeight.bold))
                     ,
                   ]),
   
  )
  ;
}