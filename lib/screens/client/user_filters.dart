import 'package:flutter/material.dart';
import 'package:thecut/screens/client/client_main_screen.dart';

class UserFiltersScreen extends StatefulWidget {
  const UserFiltersScreen({Key? key}) : super(key: key);

  @override
  State<UserFiltersScreen> createState() => _UserFiltersScreenState();
}

class _UserFiltersScreenState extends State<UserFiltersScreen> {
  bool showForMales = false;
  bool showForFemales = false;

  List<Map<String, dynamic>> filters = [
    {
      "label": "Male",
      "selected": false,
    },
    {
      "label": "Female",
      "selected": false,
    },
    {
      "label": "Unisex",
      "selected": false,
    },

    {
      "label": "Hair Cut",
      "selected": false,
    },
    {
      "label": "Beard Trim",
      "selected": false,
    },
    {
      "label": "Hair coloring",
      "selected": false,
    },
    {"label": "Sporten waves",
      "selected": false},
    {"label": "Fading cut",
      "selected": false},
    {
      "label": "Male",
      "selected": false,
    },
    {
      "label": "Female",
      "selected": false,
    },
    {
      "label": "Unisex",
      "selected": false,
    },

    {
      "label": "Hair Cut",
      "selected": false,
    },
    {
      "label": "Beard Trim",
      "selected": false,
    },
    {
      "label": "Hair coloring",
      "selected": false,
    },
    {"label": "Sporten waves",
      "selected": false},
    {"label": "Fading cut",
      "selected": false},

    {
      "label": "Washing",
      "selected": false,
    },
    {
      "label": "Perming",
      "selected": false,
    },
    {
      "label": "Hair coloring",
      "selected": false,
    },
    {"label": "Braiding",
      "selected": false},
    {"label": "Makeup",
      "selected": false},
    {"label": "Manicure",
      "selected": false},

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

       persistentFooterButtons: [
         ElevatedButton(
             style: ElevatedButton.styleFrom(
               primary: Colors.grey
                 ,
               padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
               textStyle: TextStyle(color: Colors.black),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(5)
               )
             ),
             onPressed: (){
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                 return const ClientMainScreen();
               }), (route) => false);
             }, child: Text("Skip")),
         ElevatedButton(

             style: ElevatedButton.styleFrom(
               padding:EdgeInsets.symmetric(horizontal: 35,vertical: 15),
                 shape:  RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(5)
                 )
             ),
             onPressed: (){
              print(filters.where((filter) => filter["selected"]==true).toList());
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                 return const ClientMainScreen();
               }), (route) => false);

             }, child: Text("Next")),
         FractionallySizedBox(
           widthFactor: 0.2,
         )
       ],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    """Choose your preferences""",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                      "We show you results suited to  your preferences as much as possible",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Wrap(
                 // alignment: WrapAlignment.center,
                  runSpacing: 15,
                  spacing: 10,
                  children: List.generate(filters.length, (index) => FilterChip(
                    selected:filters[index]["selected"] ,
                    selectedColor: Colors.green.withOpacity(0.3),
                    //disabledColor: Colors.white,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.black,
                    side: BorderSide(
                      color: Colors.grey,
                      width: 0.5
                    ),
                    elevation: 6,
                     padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                      label: Text(filters[index]["label"]),
    onSelected: (bool newValue) {
    setState(() {
      filters[index]["selected"]= newValue;
    });}))
                ),
              )

            ]


          ),

    )));
  }
}
