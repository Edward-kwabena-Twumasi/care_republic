import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HowToScreen extends StatefulWidget {
  const HowToScreen({Key? key}) : super(key: key);

  @override
  _HowToScreenState createState() => _HowToScreenState();
}

class _HowToScreenState extends State<HowToScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to ...'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: (){
              _launchUrl("https://youtu.be/SN8owIj7vNI");
            },
            child: const StatusObject(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Card(
                elevation:3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image:  DecorationImage(
                          image: const AssetImage('assets/report_issue.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4),
                              BlendMode.lighten)
                      ),
                      border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Report an issue',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Card(elevation:3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image:  DecorationImage(
                          image: const AssetImage('assets/feedback.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.4),
                              BlendMode.lighten)
                      ),
                      border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Provide feedback',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch ';
  }
}

class StatusObject extends StatelessWidget {
  const StatusObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
                image:  DecorationImage(
                    image: const AssetImage('assets/shop_booking.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4),
                        BlendMode.lighten)
                ),
                border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Book an Appointment',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
           Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(color: Colors.black,width: double.infinity,height: double.infinity,),
          )
        ]),
      ),
    );
  }
}

