import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/shop/search_style.dart';
import 'package:thecut/screens/shop/shop_information_page.dart';

import '../../theme/custom_theme.dart';

//initializations
List serviceStyles = [
  {
    "img": "https://picsum.photos/id/3/200/200",
    "name": "Undercut",
    "id": "h1",
    "price": "15",
    "duration": "30"
  },
  {
    "img": "https://picsum.photos/id/5/200/200",
    "name": "Quiff",
    "id": "h2",
    "price": "15",
    "duration": "30"
  },
  {
    "img": "https://picsum.photos/id/7/200/200",
    "name": "Crew Cut",
    "id": "h3",
    "price": "15",
    "duration": "45"
  },
  {
    "img": "https://picsum.photos/id/9/200/200",
    "name": "Regular Cut",
    "id": "h4",
    "price": "18",
    "duration": "30"
  },
  {
    "img": "https://picsum.photos/id/11/200/200",
    "name": "Crew Cut",
    "id": "h5",
    "price": "20",
    "duration": "30"
  }
];

class ServiceCatetegoryPage extends StatefulWidget {
  const ServiceCatetegoryPage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<ServiceCatetegoryPage> createState() => _CatetegoryPageState();
}

class _CatetegoryPageState extends State<ServiceCatetegoryPage> {
List selectedServices=[];



  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasBottomNav: true, hasAppBar: false);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text(widget.category),
         actions: [
           IconButton(onPressed: (){
             showSearch(
                 context: context,
                 delegate:
                 SearchStyle("",serviceStyles,size));
           }, icon:Icon(Icons.search))
         ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top:10),
            shrinkWrap: true,
            itemCount: serviceStyles.length,
            itemBuilder: ((context, index) =>
GestureDetector(
  onTap: (){
   setState((){
     selectedServices.contains(serviceStyles[index]["id"])?selectedServices.remove(serviceStyles[index]["id"]):
     selectedServices.add(serviceStyles[index]["id"]);
   });
  },
  child:   Container(
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      border: Border.all(color:selectedServices.contains(serviceStyles[index]["id"])? Colors.blue:Colors.transparent,
      width: 2
      ),
        borderRadius: BorderRadius.circular(15),

    ),
      child: StyleCard(size: size, context: context, service: serviceStyles[index])),
)            ))
    );
  }
}

//shop card widget
class StyleCard extends StatelessWidget {
  const StyleCard({
    Key? key,
    required this.size,
    required this.context,
    required this.service
  }) : super(key: key);

  final Sizer size;
  final BuildContext context;
  final Map<String, dynamic> service;

  //final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(

          width: size.cw(90),
          height: size.cw(25),
          child: Row(children: [
            Padding(
              padding:  EdgeInsets.all(size.cw(2)),
              child: Container(
                //padding: EdgeInsets.only(left:size.cw(2)),
                  height: size.cw(25),
                  width: size.cw(25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15),
                      image: DecorationImage(
                          image: NetworkImage(service["img"]), fit: BoxFit.cover))),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(service["name"]),
                      subtitle: Text(service["duration"]+" mins"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      padding: EdgeInsets.only(left: 8),
                      labelPadding: EdgeInsets.zero,
                      labelStyle: TextStyle(
                          fontSize: 20.sp, color: colorScheme.primary),
                      backgroundColor: Colors.transparent,
                      label: Text(service["price"]),

                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
