import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClientRegistrationScreen  extends StatelessWidget {
   const ClientRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Client Registration")),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;
  String sexGroup = '1';
  DateTime? dob = null;
  // Initial Selected Value


  final GlobalKey<FormState> ownerForm = GlobalKey<FormState>();
  final GlobalKey<FormState> shopDetailForm=GlobalKey<FormState>();
  final GlobalKey<FormState> contactForm=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stepper(
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
          if(ownerForm.currentState!.validate()){
            setState(() {
              _index += 1;
            });
          }
        }else{
          
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
            return Container(color: Colors.blue,);
          }), (route) => false);
        }

      },

      steps: <Step>[
        Step(
          isActive: _index == 0,
          title: Text('Personal'),
          content: Form(
            key:ownerForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
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
                                currentDate: DateTime(2022),
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
    );
  }
}
