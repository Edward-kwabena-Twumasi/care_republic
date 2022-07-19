import 'package:flutter/material.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/scaling/scaler.dart';

class SuccessfulRegistrationNotificationComponent extends StatefulWidget {
  const SuccessfulRegistrationNotificationComponent({Key? key})
      : super(key: key);

  @override
  _SuccessfulRegistrationNotificationComponentState createState() =>
      _SuccessfulRegistrationNotificationComponentState();
}

class _SuccessfulRegistrationNotificationComponentState
    extends State<SuccessfulRegistrationNotificationComponent> {
  @override
  Widget build(BuildContext context) {
    Sizer size= Sizer(context:context,hasAppBar: true);
    return Column(children: [
      Padding(padding:EdgeInsets.all(size.cw(10)),
          child: Image.asset('assets/successful_registration.png')),
      Text(
        "Welcome ${provider(context).userDetails['fname']} to theCut, From now on you'll be receiving regular updates on promotions, fare sales and special offers from shops around. And since you'll be the first to know, you'll always have access to the best of service available in your area.",
        textAlign: TextAlign.center,
      ),
      Text(""),
      Text('Find details on how to navigate through the application here.')
    ]);
  }

/*  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Dear customer, your appointment with {ShopName} located at {Shop Location} scheduled at {AppointmentTime} on {Date of Appointment} has been confirmed. We look forward to hearing from you. Have a blissful day",
      ),
    );
  }*/

}
