import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:thecut/models/job_model.dart';
import 'package:thecut/scaling/scaler.dart';

class JobOpeningDetailsComponent extends StatefulWidget {
  final Job jobObject;

  const JobOpeningDetailsComponent({Key? key, required this.jobObject})
      : super(key: key);

  @override
  _JobOpeningDetailsComponentState createState() =>
      _JobOpeningDetailsComponentState();
}

class _JobOpeningDetailsComponentState
    extends State<JobOpeningDetailsComponent> {
  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasAppBar: true);

    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.all(size.cw(2)),
        child: FittedBox(
            child: Text(widget.jobObject.title,
                style:
                    TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold))),
      ),
      Padding(
        padding: EdgeInsets.all(size.cw(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Type: ${widget.jobObject.workerType}"),
            Text(
                "Deadline: ${DateFormat('dd-MM-yyyy').format(widget.jobObject.date)}"),
          ],
        ),
      ),
      Padding(
          padding: EdgeInsets.all(size.cw(2)), child: const Text("Details",style: TextStyle(fontWeight: FontWeight.bold),)),
      ExpandableText(
        widget.jobObject.description,
        expandText: 'show more',
        collapseText: 'show less',
        maxLines: 2,
        linkColor: Colors.blue,
      ),
          Center(child: ElevatedButton(onPressed: (){}, child: Text('Apply Now',)))
    ]));
  }
}
