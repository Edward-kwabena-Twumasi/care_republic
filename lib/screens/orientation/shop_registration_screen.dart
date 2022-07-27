import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thecut/generator/id_generator.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/screens/shop/shop_location_registration_screen.dart';

class ShopRegistrationScreen extends StatefulWidget {
  final String phone;
  final Map<String, dynamic>? prevUserDetails;

  const ShopRegistrationScreen(
      {Key? key, required this.phone, this.prevUserDetails})
      : super(key: key);

  @override
  State<ShopRegistrationScreen> createState() => _ShopRegistrationScreenState();
}

class _ShopRegistrationScreenState extends State<ShopRegistrationScreen> {
  int _index = 0;
  String sexGroup = '0';
  DateTime? dob;

  // Initial Selected Value
  String role = 'Barbering';

  // List of items in our dropdown menu
  var items = [
    'Barbering',
    'Saloon',
    'Unisex',
    'Makeup',
    'Merchant',
  ];

  final GlobalKey<FormState> ownerForm = GlobalKey<FormState>();
  final GlobalKey<FormState> shopDetailForm = GlobalKey<FormState>();
  final GlobalKey<FormState> contactForm = GlobalKey<FormState>();

  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController sNameCtrl = TextEditingController();
  TextEditingController ownerContactCtrl = TextEditingController();
  TextEditingController shopNameCtrl = TextEditingController();
  TextEditingController landMarkCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController igHandleCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  String uid = '';

  @override
  initState() {
    super.initState();
    setState(() {
      uid = generateId();
      if (widget.prevUserDetails != null) {
        fNameCtrl.text = widget.prevUserDetails!['fname'];
        sNameCtrl.text = widget.prevUserDetails!['sname'];
        emailCtrl.text = widget.prevUserDetails!['email'];
        phoneCtrl.text = widget.prevUserDetails!['phone'];
        uid = widget.prevUserDetails!['uid'];
      }
    });
    /* WidgetsBinding.instance?.addPostFrameCallback((_){
      setState(() {
        phoneCtrl.text=provider(context).activePhone;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    print(
        "*******************Shop Registration Screen for Shops*************************");
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        phoneCtrl.text = widget.phone;
      });
    });

    return Scaffold(
        appBar: AppBar(title: const Text("Shop registration")),
        body: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Row(
              children: <Widget>[
                TextButton(
                  onPressed: controls.onStepContinue,
                  child: Text(_index == 2 ? 'PROCEED' : 'NEXT'),
                ),
                TextButton(
                  onPressed: _index == 0 ? null : controls.onStepCancel,
                  child: const Text('BACK'),
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
              if (shopDetailForm.currentState!.validate()) {
                setState(() {
                  _index += 1;
                });
              }
            } else if (_index == 2) {
              /* print({
            "first_name": fNameCtrl.text,
            "surname": sNameCtrl.text,
            "dob": dob,
            "owner_contact": ownerContactCtrl.text,
            "sex": sexGroup == '0' ? "Male" : "Female",
            "shop_name": shopNameCtrl.text,
            "land_mark": landMarkCtrl.text,
            "email": emailCtrl.text,
            "ig_handle": igHandleCtrl.text,
            "phone": phoneCtrl.text
          });*/

              if (contactForm.currentState!.validate()) {
                /* provider(context)
                .registryStream()
                .listen((QuerySnapshot<Map<String, dynamic>> event) {
              event.docs.forEach((element) {
                print(element.data());
              });
            });*/
                provider(context, type: 'shop').setTemporaryShopDetails({
                  "uid": uid,
                  "_ids": [getIdByRole(uid, role.toLowerCase())],
                  "fname": fNameCtrl.text,
                  "sname": sNameCtrl.text,
                  "dob": dob,
                  "owner_contact": ownerContactCtrl.text,
                  "sex": sexGroup == '0' ? "male" : "female",
                  "shop_name": shopNameCtrl.text,
                  "land_mark": landMarkCtrl.text,
                  "email": emailCtrl.text,
                  "ig_handle": igHandleCtrl.text,
                  "phone": phoneCtrl.text,
                  "photo_url": "",
                  "types": [role.toLowerCase()],
                  "tags": [],
                  "location": const GeoPoint(0, 0),
                  "desc": ""
                });

                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (_) {
                  return const ShopLocationRegistrationScreen();
                }), (route) => false);

                print(uid);

                /*provider(context)
                    .registeredUsers(phoneCtrl.text)
                    .then((QuerySnapshot<Map<String, dynamic>> event) {
                */ /*  if (event.docs.length < 1) {*/ /*
                    //print("New Entry over here");
                    FirebaseFirestore.instance
                        .collection("registry")
                        .doc(uid)
                        .set({
                      "uid": uid,
                      "active_id": getIdByRole(uid, role.toLowerCase()),
                      "phone": phoneCtrl.text,
                      "_ids": [getIdByRole(uid, role.toLowerCase())],
                      "last_login": DateTime.now()
                    }).then((value) {
                      */ /*   print(
                      {
                        "fname": fNameCtrl.text,
                        "sname": sNameCtrl.text,
                        "dob": dob,
                        "owner_contact": ownerContactCtrl.text,
                        "sex": sexGroup == '0' ? "Male" : "Female",
                        "shop_name": shopNameCtrl.text,
                        "land_mark": landMarkCtrl.text,
                        "email": emailCtrl.text,
                        "ig_handle": igHandleCtrl.text,
                        "phone": phoneCtrl.text,
                        "photo_url":"",
                        "types":[role.toLowerCase()],
                        "tags":[],
                        "location":const GeoPoint(0,0),
                        "desc":""
                      }
                  );*/ /*

                      provider(context, type: 'shop', listen: false)
                          .collection()
                          .doc(uid)
                          .set({
                        "uid": uid,
                        "_ids": [getIdByRole(uid, role.toLowerCase())],
                        "fname": fNameCtrl.text,
                        "sname": sNameCtrl.text,
                        "dob": dob,
                        "owner_contact": ownerContactCtrl.text,
                        "sex": sexGroup == '0' ? "male" : "female",
                        "shop_name": shopNameCtrl.text,
                        "land_mark": landMarkCtrl.text,
                        "email": emailCtrl.text,
                        "ig_handle": igHandleCtrl.text,
                        "phone": phoneCtrl.text,
                        "photo_url": "",
                        "types": [role.toLowerCase()],
                        "tags": [],
                        "location": const GeoPoint(0, 0),
                        "desc": ""
                      }).then((value) {
                        print('Shop Added Successfully');
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (_) {
                              return const ShopLocationRegistrationScreen();
                            }), (route) => false);
                      });
                    });

                 */ /* } else {
                    print('Phone number Already exist in system');
                  }*/ /*
                });*/
              }
            }
          },
          steps: <Step>[
            Step(
              isActive: _index == 0,
              title: const Text('Owner info'),
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
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Shop Owner's Surname is Required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          /*  prefixIcon: Icon(Icons.person),*/
                          contentPadding: const EdgeInsets.only(bottom: 3),
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
                    /*TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is Required';
                      } else if (value.length != 10) {
                        return 'Total Digits must be equal to 10';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                        */ /*  prefixIcon: Icon(Icons.phone),*/ /*
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Shop Phone number',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        */ /*  hintText: 'Eg. 0XXXXXXXXX',*/ /*
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.4),
                        ))),
                const SizedBox(
                  height: 10.0,
                ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Date of Birth: ${dob == null ? "dd/mm/yyyy" : DateFormat('dd-MM-yyyy').format(dob!)}"),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    /*  TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Your Location is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_pin),
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Land Mark',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Eg. Davis Street',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.4),
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),*/
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
                        const Text('Female')
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: ownerContactCtrl,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Owner's contact is Required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          /*  prefixIcon: Icon(Icons.person),*/
                          contentPadding: const EdgeInsets.only(bottom: 3),
                          labelText: "Owner's contact",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          /* hintText: 'Eg. John',*/
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.4),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Step(
              isActive: _index == 1,
              title: const Text('Shop Details'),
              content: Form(
                key: shopDetailForm,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: shopNameCtrl,
                        maxLength: 15,
                        validator: (value) {
                          if (value!.trim() == null || value.isEmpty) {
                            return 'Name of shop is Required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            /* prefixIcon: Icon(Icons.local_convenience_store_rounded),*/
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: 'Shop name',
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
                        controller: landMarkCtrl,
                        maxLength: 15,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Landmark is required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            /*  prefixIcon: Icon(Icons.person),*/
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: 'Popular nearby location',
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
                      ListTile(
                        title: const Text(
                          'Primary type',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: DropdownButton(
                          value: role,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              role = newValue!;
                            });
                          },
                        ),
                      )
                    ]),
              ),
            ),
            Step(
              isActive: _index == 2,
              title: const Text('Contact'),
              content: Form(
                key: contactForm,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: 'Email',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: 'Primary number',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Instagram handle is required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: 'Instagram handle',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
