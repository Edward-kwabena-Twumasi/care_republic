//Appointment info and confirmation.show appointment info
// together with shop info and ask for payment option

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:thecut/providers/app_provider.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/client/client_main_screen.dart';
import 'package:thecut/screens/shop/payment_screen.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage(
      {Key? key,
      required this.services,
      required this.datetime,
      required this.shopId,
      required this.shopName})
      : super(key: key);
  final List services;
  final DateTime datetime;
  final String shopId;
  final String shopName;

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  AppProvider provider() {
    return Provider.of<AppProvider>(context, listen: false);
  }

  double total = 0;
  int duration = 0;
  String phone = "";
  BoxDecoration unselected = BoxDecoration();
  String appointmentId = "";

  void initState() {
    super.initState();
    appointmentId = provider().activePhone! +
        DateTime.now().microsecondsSinceEpoch.toString();
    setState(() {
      phone = Provider.of<AppProvider>(context, listen: false).activePhone!;
    });
    for (var ob in widget.services) {
      setState(() {
        total += double.parse(ob["price"]);
        duration += int.parse(ob["duration"]);
      });
    }
  }

  Future<Response> makePayment(String id, String fname, String lname,
      String phone, double amount, email) {
    return post(
      Uri.parse('https://api.paystack.co/transaction/initialize'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer sk_live_20a17270c56f71eeb3b8dced173f3c31dc49accd'
      },
      body: jsonEncode(<String, dynamic>{
        //"api_key": "d37e4e08a0fc40b39abf5ce36a8d70c75fe05b83",
        "user": "mobile",
        "firstname": fname,
        "surname": lname,
        "contact_number": phone,
        "email": email,
        "amount": amount,
        "request_id": id
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasAppBar: true, hasBottomNav: false);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("Pay", style: TextStyle(color: Colors.black)),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ListTile(
              subtitle: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: DateFormat(' dd MMM. yyyy, EEE   hh:mm aaa')
                        .format(widget.datetime)
                        .toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ))
              ])),
              title: Text(
                widget.shopName,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 5, top: 10),
          child: Text("Your services"),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.services.length,
            itemBuilder: (itemBuilder, idx) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/cutcut.png"),
                                fit: BoxFit.cover)),
                        width: 45,
                        height: 45,
                      )),
                  title: Row(
                    children: [
                      Text(
                        widget.services[idx]["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      Spacer(),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: widget.services[idx]["price"].toString(),
                            style:
                                TextStyle(fontSize: 19, color: Colors.black)),
                        TextSpan(
                            text: " GHS",
                            style: TextStyle(fontSize: 10, color: Colors.black))
                      ])),
                    ],
                  ),
                  subtitle: Text(
                      widget.services[idx]["duration"].toString() + " mins"),
                ),
              );
            })
// }),
//
        ,
        Spacer(),
        Row(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Total  ",
                            style: TextStyle(color: Colors.blue)),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: total.toString(),
                            style:
                                TextStyle(fontSize: 19, color: Colors.black)),
                        TextSpan(
                            text: " GHS",
                            style: TextStyle(fontSize: 10, color: Colors.black))
                      ])),
                    ])),
              ),
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Duration",
                            style: TextStyle(color: Colors.blue)),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: duration.toString(),
                            style:
                                const TextStyle(fontSize: 19, color: Colors.black)),
                        const TextSpan(
                            text: " mins",
                            style: TextStyle(fontSize: 10, color: Colors.black))
                      ])),
                    ])),
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  primary: Colors.lightBlue),
              onPressed: () {
                showPaymentSelectionMethod(size);
                /* showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          //this right here
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.cw(80),
                                  vertical: size.ch(1)),
                              child: SizedBox(
                                  height: size.ch(35),
                                  width: size.cw(80),
                                  child: Column(children: [
                                    Padding(
                                        padding: EdgeInsets.all(size.ch(1)),
                                        child: Text(
                                          'Payment Method',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Image.asset(
                                      'assets/map_settings.png',
                                      height: size.cw(15),
                                    ),
                                    Text(
                                      'Choose yes to pay or no to pay later?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 11.sp),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('No'),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.black54,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (buildCtx) {
                                                    final client =
                                                        provider().userDetails;
                                                    makePayment(
                                                            client['uid'],
                                                            client['firstName'],
                                                            client['lastName'],
                                                            client['uid'],
                                                            total,
                                                            client['email'])
                                                        .then((value) {
                                                      final bodyParams =
                                                          jsonDecode(
                                                              value.body);
                                                      print(value.body);
                                                      */
                /* print(bodyParams['resp_code']);
                                        print(bodyParams);*/ /*

                         final Map<String, dynamic>  requestDetails = {
                                                        "barber_id": "",
                                                        "client_id": phone,
                                                        "client_name": provider().userDetails["firstName"],
                                                        "comment": "",
                                                        "date": widget.datetime,
                                                        "duration": duration,
                                                        "end_time": widget.datetime
                                                            .add(Duration(minutes: duration)),
                                                        "rate": 0,
                                                        "amount": total,
                                                        "service_status":
                                                            "PENDING",
                                                        "services":
                                                            widget.services,
                                                        "shop_id":
                                                            widget.shopId,
                                                        "shop_name":
                                                            widget.shopName,
                                                        "shop_watched": false,
                                                        "client_watched": true,
                                                      };
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder: (builder) {
                                                        return PaymentScreen(
                                                            couponUrl: bodyParams[
                                                                    'data'][
                                                                'authorization_url'],
                                                            appointmentId:
                                                                appointmentId,
                                                            requestDetails:
                                                                requestDetails,
                                                            transactionId:
                                                                bodyParams['data']['reference']);
                                                      }));
                                                    });

                                                    return Dialog(
                                                      child: SizedBox(
                                                        height: 30,
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: Text(
                                                                  "Initialising payment"),
                                                            ),
                                                            LinearProgressIndicator()
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: const Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1),
                                                primary: Colors.orange,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                          )
                                        ],
                                      ),
                                    )
                                    // const Spacer(),
                                  ]))));
                    });*/
              },
              child: const Text("Checkout"),
            ),
          ),
        )
      ]),
    );
  }

  showPaymentSelectionMethod(Sizer size) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //this right here
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.cw(3), vertical: size.ch(5)),
                  child: SizedBox(
                      height: size.ch(35),
                      width: size.cw(80),
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.all(size.ch(1)),
                            child: Text(
                              'Payment Option',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            )),
                        Image.asset(
                          'assets/map_settings.png',
                          height: size.ch(15),
                        ),
                        Text(
                          'Pay for service now or choose NO to pay in shop?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.cw(3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                                    return const ClientMainScreen();
                                  }), (route) => false);
                                },
                                child: const Text('No'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black54,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.cw(10)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (yesCtx) {
                                        final client = provider().userDetails;
                                        makePayment(
                                                client['uid'],
                                                client['firstName'],
                                                client['lastName'],
                                                client['uid'],
                                                total,
                                                client['email'])
                                            .then((value) {
                                          final bodyParams =
                                              jsonDecode(value.body);
                                          print(value.body);

                                          final Map<String, dynamic>
                                              requestDetails = {
                                            "barber_id": "",
                                            "client_id": phone,
                                            "client_name": provider()
                                                .userDetails["firstName"],
                                            "comment": "",
                                            "date": widget.datetime,
                                            "duration": duration,
                                            "end_time": widget.datetime.add(
                                                Duration(minutes: duration)),
                                            "rate": 0,
                                            "amount": total,
                                            "service_status": "PENDING",
                                            "services": widget.services,
                                            "shop_id": widget.shopId,
                                            "shop_name": widget.shopName,
                                            "shop_watched": false,
                                            "client_watched": true,
                                          };
                                          Navigator.pop(yesCtx);
                                          Navigator.push(yesCtx,
                                              MaterialPageRoute(
                                                  builder: (builder) {
                                            return PaymentScreen(
                                                couponUrl: bodyParams['data']
                                                    ['authorization_url'],
                                                appointmentId: appointmentId,
                                                requestDetails: requestDetails,
                                                transactionId:
                                                    bodyParams['data']
                                                        ['reference']);
                                          }));
                                        });

                                        return Dialog(
                                          child: SizedBox(
                                            height: size.ch(10),
                                            child: Column(
                                              children: const [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.all(2.0),
                                                  child: Text(
                                                      "Initialising payment"),
                                                ),
                                                LinearProgressIndicator()
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.cw(10)),
                                    primary: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              )
                            ],
                          ),
                        )
                        // const Spacer(),
                      ]))));
        });
  }
}
