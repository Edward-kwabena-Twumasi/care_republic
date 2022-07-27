import 'package:flutter/material.dart' hide Notification;
import 'package:thecut/models/job_model.dart';
import 'package:thecut/models/notification_model.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/worker/notification/successful_registration_notification_component.dart';

import 'job_opening_details_component.dart';


class DefaultNotificationScreen extends StatefulWidget {
  final Notification notificationDetails;

  const DefaultNotificationScreen({Key? key, required this.notificationDetails})
      : super(key: key);

  @override
  _DefaultNotificationScreenState createState() =>
      _DefaultNotificationScreenState();
}

class _DefaultNotificationScreenState extends State<DefaultNotificationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.notificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasAppBar: true, hasBottomNav: false);
    return Scaffold(
      appBar: AppBar(
        leading: getNotificationIcon(widget.notificationDetails.type),
        title: Text(getNotificationTitle(widget.notificationDetails.type)),
      ),
      body: Column(
        children: [

        Padding(
          padding:  EdgeInsets.all(size.cw(2)),
          child: getMessageWidget(),
        )],
      ),
    );
  }

  Widget getMessageWidget(){
    String type=widget.notificationDetails.type;
    switch(type){
      case 'JOB': return JobOpeningDetailsComponent(jobObject: widget.notificationDetails.job!);
      default: return SuccessfulRegistrationNotificationComponent();
    }

  }


  String getNotificationTitle(String notificationType){
    
    switch(notificationType){
      case "JOB":return "Job Alert";
      default: return "Success Notice";
    }
  }

  Widget getNotificationIcon(String notificationType){
    switch(notificationType){
      case "JOB": return Icon(Icons.work);
      default: return Icon(Icons.notifications);
    }
  }
  
}
