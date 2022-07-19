import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thecut/generator/id_generator.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/screens/client/client_main_screen.dart';

class ClientRegistrationScreen  extends StatefulWidget {
  final Map<String,dynamic>? prevDetails;

   const ClientRegistrationScreen({Key? key,this.prevDetails}) : super(key: key);

  @override
  State<ClientRegistrationScreen> createState() => _ClientRegistrationScreenState();

}

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen> {
  int _index = 0;
  String sexGroup = '1';
  DateTime? dob = null;
  // Initial Selected Value
  String dropdownvalue = 'Barber';

  // List of items in our dropdown menu
  var items = [
    'Barber',
    'Hair dresser',
    'Makeup artist'
  ];
  String uid='';

  final GlobalKey<FormState> personalDetailsForm = GlobalKey<FormState>();
  //final GlobalKey<FormState> shopDetailForm=GlobalKey<FormState>();
  final GlobalKey<FormState> contactForm=GlobalKey<FormState>();
  final TextEditingController fNameCtrl=TextEditingController();
  final TextEditingController sNameCtrl=TextEditingController();
  final TextEditingController phoneCtrl=TextEditingController();
  final TextEditingController emailCtrl=TextEditingController();

 // final TextEditingController fNameCtrl=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      uid = generateId();
      print(uid);
      if(widget.prevDetails!=null){
        phoneCtrl.text=widget.prevDetails!['phone'];
        emailCtrl.text=widget.prevDetails!['email'];
        fNameCtrl.text=widget.prevDetails!['fname'];
        sNameCtrl.text=widget.prevDetails!['sname'];
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Client Registration'),),
      body:  Stepper(
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: controls.onStepContinue,
                child:  Text(_index==1?'PROCEED':'NEXT'),
              ),
              TextButton(
                onPressed: _index==0?null:controls.onStepCancel,
                child:  Text('BACK'),
              ),
            ],
          );
        },
        type: StepperType.horizontal,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if(_index==0){
            if(personalDetailsForm.currentState!.validate()){
              setState(() {
                _index += 1;
              });
            }
          }else{

            if (contactForm.currentState!.validate()) {
              /* provider(context)
                .registryStream()
                .listen((QuerySnapshot<Map<String, dynamic>> event) {
              event.docs.forEach((element) {
                print(element.data());
              });
            });*/

              provider(context).collection().doc(uid).set({
                "uid": uid,
                "active_id": getIdByRole(uid, ('client').toLowerCase()),
                "phone": phoneCtrl.text,
                "_ids": [getIdByRole(uid, ('client').toLowerCase())],
                "last_login": DateTime.now()
              }).then((value){



                provider(context,type: 'client',listen: false).collection().doc(uid).set(
                    {"uid":uid,
                      "_ids":[getIdByRole(uid, 'client')],
                      "fname": fNameCtrl.text,
                      "sname": sNameCtrl.text,
                      "dob": dob,
                      "sex": sexGroup == '0' ? "male" : "female",
                      "email": emailCtrl.text,
                      "phone": phoneCtrl.text,
                      "photo_url":"",
                    }
                ).then((value){
                  print('Shop Added Successfully');
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
                    return ClientMainScreen();
                  }), (route) => false);
                });
              });
            }

          }

          /* if (_index <= 1) {
          setState(() {
            _index += 1;
          });
        }*/
        },
        /*onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },*/
        steps: <Step>[
          Step(
            isActive: _index == 0,
            title: Text('Personal'),
            content: Form(
              key:personalDetailsForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: fNameCtrl,
                    maxLength: 15,
                    validator: (value) {
                      if (value!.trim() == null || value.isEmpty) {
                        return 'First name is Required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      /* prefixIcon: Icon(Icons.local_convenience_store_rounded),*/
                        contentPadding: const EdgeInsets.only(bottom: 3),
                        labelText: 'First name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        /* hintText: "Eg.John's shop",*/
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.4),
                        )),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: sNameCtrl,
                    maxLength: 15,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Surname Name is Required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      /*  prefixIcon: Icon(Icons.person),*/
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Surname',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        /* hintText: 'Eg. John',*/
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.4),
                        )),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Date of Birth: ${dob == null ? "dd/mm/yyyy" : DateFormat('dd-MM-yyyy').format(dob!)}"),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime(1970),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2200))
                              .then((value) {
                            print(value);
                            setState(() {
                              dob = value;
                            });
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Radio(
                        toggleable: true,
                        value: '0',
                        groupValue: sexGroup,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              print(value);
                              sexGroup = value.toString();
                            });
                          }
                        },
                        activeColor: Colors.black,
                      ),
                      const Text('Male'),
                      Radio(
                        value: '1',
                        groupValue: sexGroup,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              print(value);
                              sexGroup = value.toString();
                            });
                          }
                        },
                        activeColor: Colors.black,
                      ),
                      Text('Female')
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                /*  ListTile(title: Text('Primary type',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  )*/

                ],
              ),
            ),
          ),
          Step(
            isActive: _index == 1,
            title: Text('Contact'),
            content:  Form(
              key:contactForm,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TextFormField(
                  controller: emailCtrl,
                  validator: (value) {
                    if (value!.trim() == null || value.isEmpty) {
                      return 'Email of shop is Required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    /* prefixIcon: Icon(Icons.local_convenience_store_rounded),*/
                      contentPadding: const EdgeInsets.only(bottom: 3),
                      labelText: 'Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      /* hintText: "Eg.John's shop",*/
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.4),
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: phoneCtrl,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Primary number is required";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  enabled: false,
                  decoration: InputDecoration(
                    /*  prefixIcon: Icon(Icons.person),*/
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Primary number',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      /* hintText: 'Eg. John',*/
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.4),
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Instagram handle is required";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    /*  prefixIcon: Icon(Icons.person),*/
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Instagram handle',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      /* hintText: 'Eg. John',*/
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.4),
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),

              ]),
            ),
          ),
        ],
      ),
    );
  }
}
