import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thecut/screens/client/client_main_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key,
    required this.couponUrl,
    required this.appointmentId,
    required this.requestDetails,required this.transactionId})
      : super(key: key);
  final String couponUrl;
  final String appointmentId;
  final Map<String, dynamic> requestDetails;
  final String transactionId;

  Widget build(BuildContext context) {
    final realUrl = couponUrl.replaceAll('http:', 'https:');
    return SafeArea(
      child: Scaffold(
          body: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: realUrl,
              navigationDelegate: (NavigationRequest request) async {
              
                print(request);
                requestDetails['transaction_id'] = transactionId;
          print(request.url);
                requestDetails['id'] = appointmentId;
               if (request.url.contains("https://www.facebook.com")) {
                 
               
                FirebaseFirestore.instance
                    .collection("payments")
                    .doc(transactionId)
                    .set({
                      'id':transactionId,
                      'client_id':requestDetails['client_id'],
                      'client_name':requestDetails['client_name'],
                      'amount':requestDetails['amount'],
                      'shop_id':requestDetails['shop_id'],
                      'service_status':"PENDING",
                      'claim_rights':requestDetails['client_id'],
                      'claimed':false,
                      'claimed_at':DateTime.now(),

                }).then((value){
                  FirebaseFirestore.instance
                      .collection("appointments")
                      .doc(appointmentId)
                      .set(requestDetails)
                      .then((value) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (builder) {
                          return ClientMainScreen();
                        }), (route) => false);
                  });
                });

}



                /*  if (request.url.contains("download")) {
                setState(() {
                  shouldChangeStack = false;
                });
                if (await canLaunch(request.url)) {
                  await launch(request.url);
                }
                return NavigationDecision.prevent;
              } else {
                setState(() {
                  shouldChangeStack = true;
                });
                return NavigationDecision.navigate;
              }*/
                return NavigationDecision.navigate;
              })),
    );
  }
}
