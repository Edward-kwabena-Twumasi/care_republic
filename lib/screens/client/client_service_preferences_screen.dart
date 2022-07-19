import 'package:flutter/material.dart';
import 'package:thecut/screens/client/client_main_screen.dart';

class ClientServicePreferenceScreen extends StatefulWidget {
  const ClientServicePreferenceScreen({Key? key}) : super(key: key);

  @override
  State<ClientServicePreferenceScreen> createState() => _ClientServicePreferenceScreenState();
}

class _ClientServicePreferenceScreenState extends State<ClientServicePreferenceScreen> {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
            return const ClientMainScreen();
          }), (route) => false);
        },
        child: Text("Skip"),
        ),
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

              Center(
                child: Column(
                  children: [
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
                                    labelStyle: const TextStyle(
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
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              showForMales?  Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("For Males",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
                    Checkbox(
                      side: BorderSide(color: Colors.black),
                      activeColor: Colors.black,
                      value: true, onChanged: (bool? newValue) {
                      setState(() {
                        //_throwShotAway = newValue!;
                      });
                    },)
                  ],
                ),
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
                            avatar: const CircleAvatar(
                              backgroundImage: AssetImage("images/salon.jpg"),
                            ),
                              selectedColor: Colors.green.withOpacity(0.25),
                              backgroundColor: Colors.white,
                              elevation: 2,
                              labelStyle: const TextStyle(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("For Females",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
                    Checkbox(
                      side: BorderSide(color: Colors.black),
                      activeColor: Colors.black,
                      value: true, onChanged: (bool? newValue) {
                      setState(() {
                        //_throwShotAway = newValue!;
                      });
                    },)
                  ],
                ),
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
                            avatar: const CircleAvatar(
                              backgroundImage: AssetImage("images/salon.jpg"),
                            ),
                              selectedColor: Colors.green.withOpacity(0.25),
                              backgroundColor: Colors.white,
                              elevation: 2,
                              labelStyle: const TextStyle(
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
