import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:thecut/enums/user_enum.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/scaling/scaler.dart';

class PostJobOfferScreen extends StatefulWidget {
  const PostJobOfferScreen({Key? key}) : super(key: key);

  @override
  _PostJobOfferScreenState createState() => _PostJobOfferScreenState();
}

class _PostJobOfferScreenState extends State<PostJobOfferScreen> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  WorkerType workerType = WorkerType.values.first;

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasBottomNav: false, hasAppBar: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post a job offer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.cw(8)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.cw(5)),
                child: const Text(
                  'Fill the form below to reach out to prospective workers',
                  textAlign: TextAlign.start,
                ),
              ),
              Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: titleCtrl,
                        maxLength: 25,
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
                            labelText: 'Job Title',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            /* hintText: "Eg.John's shop",*/
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.4),
                            )),
                      ),
                      DropdownButton(
                        // Initial Value
                        value: workerType,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: WorkerType.values.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(getWorkerTypeNameByEnum(e)),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (WorkerType? newValue) {
                          setState(() {
                            workerType = newValue!;
                            print(workerType);
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: descCtrl,
                          maxLines: 4, //or null
                          decoration: InputDecoration(
                            /* prefixIcon: Icon(Icons.local_convenience_store_rounded),*/
                              contentPadding: const EdgeInsets.only(bottom: 3),
                              labelText: 'Job Description',
                              floatingLabelBehavior: FloatingLabelBehavior
                                  .always,
                              /* hintText: "Eg.John's shop",*/
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.4),
                              )),
                        ),
                      )
                    ],
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder:
                            (BuildContext context) {
                          return Dialog(
                            shape:
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    10.0)),
                            //this right here
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(
                                  horizontal:
                                  size.cw(3),
                                  vertical:
                                  size.ch(5)),
                              child: SizedBox(
                                height:
                                size.ch(30),
                                child: OverflowBox(
                                  alignment:
                                  Alignment.center,
                                  maxHeight:
                                  size.ch(30),
                                  child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(
                                                size.ch(
                                                    1)),
                                            child: Text(
                                              'Transitioning',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            )),
                                        Text(
                                          "Posting job offer",
                                          textAlign:
                                          TextAlign
                                              .center,
                                          style: TextStyle(
                                              fontSize:
                                              11.sp),
                                        ),
                                        Column(
                                          children: const [
                                            SpinKitChasingDots(
                                              color: Colors
                                                  .orange,
                                            )
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          );
                        });

                    FirebaseFirestore.instance.collection('job').add({
                      'title': titleCtrl.text,
                      'desc': descCtrl.text,
                      'worker_type': workerType.toString(),
                      'shop_id': "0271302702",
                      'vacancy_active': true
                    }).then((value) {
                      print("Done inserting");
                      titleCtrl.text='';
                      descCtrl.text='';
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Post'))
            ],
          ),
        ),
      ),
    );
  }
}
