import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool showForMales = false;
  bool showForFemales = false;

  List<Map<String, dynamic>> sexCategory = [
    {
      "label": "Male",
      "selected": false,
    },
    {
      "label": "Female",
      "selected": false,
    },
    {
      "label": "General",
      "selected": false,
    }
  ];


 List<Map<String, dynamic>> maleCategory = [
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
    
  ];
  List<Map<String, dynamic>> femaleCategory = [
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Choose your preferences",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                      "We show you results suited to  your preferences as much as possible",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Sex category",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    ...sexCategory
                        .map(
                          (sex) => FilterChip(
                              selectedColor: Colors.green.withOpacity(0.25),
                              backgroundColor: Colors.white,
                              elevation: 2,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                              onSelected: ((value) {
                                setState(() {
                                  sex["selected"] = value;
                                     sex["label"]=="Male"?
        
                                  showForMales = value:showForFemales=value;
                                });
                              }),
                              label: Text(sex["label"]),
                              selected: sex["selected"]),
                        )
                        .toList()
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              showForMales? Padding(
                padding: EdgeInsets.all(10),
                child: Text("For Males",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
              ):Text(""),
              showForMales?
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child:  Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    ...maleCategory
                        .map(
                          (maleCategory) => FilterChip(
                            avatar: CircleAvatar(
                              backgroundImage: AssetImage("images/salon.jpg"),
                            ),
                              selectedColor: Colors.green.withOpacity(0.25),
                              backgroundColor: Colors.white,
                              elevation: 2,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                              onSelected: ((value) {
                                setState(() {
                                  maleCategory["selected"] = value;
                                    
                                });
                              }),
                              label: Text(maleCategory["label"]),
                              selected: maleCategory["selected"]),
                        )
                        .toList()
                  ],
                ),
              ):Text(""),
               showForFemales?
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("For Females",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
              ):Text(""),
              showForFemales?
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    ...femaleCategory
                        .map(
                          (femaleCategory) => FilterChip(
                            avatar: CircleAvatar(
                              backgroundImage: AssetImage("images/salon.jpg"),
                            ),
                              selectedColor: Colors.green.withOpacity(0.25),
                              backgroundColor: Colors.white,
                              elevation: 2,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                              onSelected: ((value) {
                                setState(() {
                                  femaleCategory["selected"] = value;
                                    
                                });
                              }),
                              label: Text(femaleCategory["label"]),
                              selected: femaleCategory["selected"]),
                        )
                        .toList()
                  ],
                ),
              ):Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
