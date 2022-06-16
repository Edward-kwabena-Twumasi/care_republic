import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../scaling/scaler.dart';

class UserStatusSelectionScreen extends StatefulWidget {
  const UserStatusSelectionScreen({Key? key}) : super(key: key);

  @override
  _UserStatusSelectionScreenState createState() =>
      _UserStatusSelectionScreenState();
}

class _UserStatusSelectionScreenState extends State<UserStatusSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(hasBottomNav: false, hasAppBar: false, context: context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.cw(100),
          height: size.ch(100),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(size.ch(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "What are you here for?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Text(
                  'Add shops for users to locate you,enroll as a worker or explore services',
                  style: TextStyle(fontSize: 12.sp,),textAlign: TextAlign.center,),
              SizedBox(
                height: size.ch(5),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://youtu.be/SN8owIj7vNI");
                    },
                    child: StatusObject(
                      title: "Makeup",
                      subTitle: "Find your customers",
                      assetUrl: 'assets/makeup_state.jpg',
                      backgroundColor: Color(0x26DA285E),
                      titleColor: Colors.pinkAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://youtu.be/SN8owIj7vNI");
                    },
                    child: StatusObject(
                      title: "Saloon",
                      subTitle: "Find your customers",
                      assetUrl: 'assets/saloon_state.jpg',
                      backgroundColor: Color(0x2691F195),
                      titleColor: Color(0xff222288),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://youtu.be/SN8owIj7vNI");
                    },
                    child: StatusObject(
                      title: "Merchant",
                      subTitle: "Sell your stuff",
                      assetUrl: 'assets/merchant_state.jpg',
                      backgroundColor: Color(0x4226FF85),
                      titleColor: Color(0xFF01341D),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://youtu.be/SN8owIj7vNI");
                    },
                    child: StatusObject(
                      title: "Worker",
                      subTitle: "Find your customers",
                      assetUrl: 'assets/worker_state.jpg',
                      backgroundColor: Color(0x26B3FF45),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://youtu.be/SN8owIj7vNI");
                    },
                    child: StatusObject(
                      title: "Customer",
                      subTitle: "Explore services",
                      assetUrl: 'assets/customer_state.jpg',
                      backgroundColor: Color(0x5AFDB301),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch ';
  }
}

class StatusObject extends StatefulWidget {
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final Color titleColor;
  final Color subTitleColor;
  final String assetUrl;

  /* final String url,
  final */
  const StatusObject(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.backgroundColor,
      this.titleColor = Colors.black,
      this.subTitleColor = Colors.black54,
      required this.assetUrl})
      : super(key: key);

  @override
  State<StatusObject> createState() => _StatusObjectState();
}

class _StatusObjectState extends State<StatusObject> {
  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasAppBar: false, hasBottomNav: false);
    return Padding(
      padding: EdgeInsets.all(size.cw(1)),
      child: Stack(alignment: AlignmentDirectional.topCenter, children: [
        Container(
          width: size.cw(47),
          height: size.ch(22),
          /*Must be removed if Row is used instead of grid*/
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              /* Padding(
                padding: EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    'Book an Appointment',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              )*/
            ],
          ),
        ),
        Positioned(
          top: 50,
          child: Container(
            height: size.ch(15),
            width: size.cw(49),
            decoration: BoxDecoration(
                /* border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid),*/
                color: widget.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(17))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: size.ch(3.5)),
                  child: FittedBox(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: widget.titleColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                FittedBox(
                    child: Text(
                  widget.subTitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: widget.subTitleColor,
                  ),
                )),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.cw(10))),
              elevation: 3,
              color: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(widget.assetUrl),
                radius: size.cw(10),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

/*Expanded(
                child: GridView.count(
                  mainAxisSpacing: size.ch(1),
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchUrl("https://youtu.be/SN8owIj7vNI");
                      },
                      child: StatusObject(
                        title: "Makeup",
                        subTitle: "Find your customers",
                        assetUrl: 'assets/makeup_state.jpg',
                        backgroundColor: Color(0x26DA285E),
                        titleColor: Colors.pinkAccent,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchUrl("https://youtu.be/SN8owIj7vNI");
                      },
                      child: StatusObject(
                        title: "Saloon",
                        subTitle: "Find your customers",
                        assetUrl: 'assets/saloon_state.jpg',
                        backgroundColor: Color(0x2691F195),
                        titleColor: Color(0xff222288),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchUrl("https://youtu.be/SN8owIj7vNI");
                      },
                      child: StatusObject(
                        title: "Merchant",
                        subTitle: "Find your customers",
                        assetUrl: 'assets/merchant_state.jpg',
                        backgroundColor: Color(0x4226FF85),
                        titleColor: Color(0xFF01341D),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchUrl("https://youtu.be/SN8owIj7vNI");
                      },
                      child: StatusObject(
                        title: "Worker",
                        subTitle: "Find your customers",
                        assetUrl: 'assets/worker_state.jpg',
                        backgroundColor: Color(0x26FFA7EC),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchUrl("https://youtu.be/SN8owIj7vNI");
                      },
                      child: StatusObject(
                        title: "Worker",
                        subTitle: "Find your customers",
                        assetUrl: 'assets/worker_state.jpg',
                        backgroundColor: Color(0x26FFA7EC),
                      ),
                    ),
                  ],
                ),
              )*/
