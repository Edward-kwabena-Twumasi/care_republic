import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thecut/generator/id_generator.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/screens/client/client_main_screen.dart';
import 'package:thecut/screens/worker/worker_main_screen.dart';

class WorkerRegistrationScreen extends StatefulWidget {
  final Map<String,dynamic>? prevDetails;
  const WorkerRegistrationScreen({Key? key,this.prevDetails}) : super(key: key);

  @override
  State<WorkerRegistrationScreen> createState() => _WorkerRegistrationScreenState();
}

class _WorkerRegistrationScreenState extends State<WorkerRegistrationScreen> {
  int _index = 0;
  String sexGroup = '0';
  DateTime? dob = null;

  // Initial Selected Value
  String workerType = 'Barber';
  String uid = '';

  // List of items in our dropdown menu
  var items = ['Barber', 'Hair dresser', 'Makeup artist'];

  final GlobalKey<FormState> ownerForm = GlobalKey<FormState>();
  final GlobalKey<FormState> shopDetailForm = GlobalKey<FormState>();
  final GlobalKey<FormState> contactForm = GlobalKey<FormState>();

  final TextEditingController fNameCtrl = TextEditingController();
  final TextEditingController igHandleCtrl = TextEditingController();
  final TextEditingController sNameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

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
        body:Stepper(
      controlsBuilder: (BuildContext context, ControlsDetails controls) {
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: controls.onStepContinue,
              child: Text(_index == 1 ? 'PROCEED' : 'NEXT'),
            ),
            TextButton(
              onPressed: _index == 0 ? null : controls.onStepCancel,
              child: Text('BACK'),
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
        if (_index == 0) {
          if (ownerForm.currentState!.validate()) {
            setState(() {
              _index += 1;
            });
          }
        } else if (_index == 1) {
          if(contactForm.currentState!.validate()) {
            provider(context).collection().doc(uid).set({
            "uid": uid,
            "active_id": getIdByRole(uid, workerType.toLowerCase()),
            "phone": phoneCtrl.text,
            "_ids": [getIdByRole(uid, workerType.toLowerCase())],
            "last_login": DateTime.now()
          }).then((_){
            provider(context, type: 'worker', listen: false)
                .collection()
                .doc(uid)
                .set({
              "_ids": [getIdByRole(uid, workerType.toLowerCase())],
              "fname": fNameCtrl.text,
              "sname": sNameCtrl.text,
              "dob": dob,
              "sex": sexGroup == '0' ? "male" : "female",
              "email": emailCtrl.text,
              "phone": phoneCtrl.text,
              "desc":"",
              "photo_url": "",
              "resume_url":""
            }).then((value) {
              print('Worker Added Successfully');
              showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      content: Text('Registration Successful'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(builder).pop();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (builder) {
                                    return WorkerMainScreen();
                                  }));
                            },
                            child: Text('ok'))
                      ],
                    );
                  });
            });
          });
          }

        }

      },

      steps: <Step>[
        Step(
          isActive: _index == 0,
          title: Text('Personal'),
          content: Form(
            key: ownerForm,
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
                      return "Surname is Required";
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
                    Text('Male'),
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
                ListTile(
                  title: Text(
                    'Primary type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: DropdownButton(
                    // Initial Value
                    value: workerType,

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
                        workerType = newValue!;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Step(
          isActive: _index == 1,
          title: Text('Contact'),
          content: Form(
            key: contactForm,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                controller: emailCtrl,
                validator: (value) {
                  if (value!.trim() == null || value.isEmpty) {
                    return 'Email of worker is Required';
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
                enabled: false,
                controller: phoneCtrl,
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Primary number is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
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
                controller: igHandleCtrl,
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
    ));
  }
}
