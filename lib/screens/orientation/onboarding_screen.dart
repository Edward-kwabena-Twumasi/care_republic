import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thecut/screens/orientation/user_status_selection_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  //this function is to call home page when introduction screen done
  void _onIntroEnd(context) {
    /*Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );*/
  }

//this function is to render images from assets folder
  Widget _buildImage(String assetName) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/$assetName.jpg'),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover)));

    return Align(
      child: Image.asset('images/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildImageJPG(String assetName) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/$assetName.jpg'),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain)));

    return Align(
      child: Image.asset(
        'images/$assetName.jpg',
        width: 350.0,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    //this is page decoration of background
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      /*  pageColor: Colors.blueAccent,*/
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "Salon",
            body: "Add salon, let customers find you easily",
            image: _buildImage('saloon_state'),
            decoration: PageDecoration(
             /* pageColor: Colors.black.withOpacity(1)*/
                pageColor: Color(0xffe4e5e7).withOpacity(1)
            ),
            /*   footer: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => Container(
                      color: Colors.green,
                    )),
                  );
                },
                child: Text('Join us'),
              )*/
          ),
          PageViewModel(
            title: "Cosmetic shop",
            body: "Add shop, showcase products for sale👌",
            image: _buildImage('cosmetics_state'),
            decoration: PageDecoration(
              pageColor: Color(0xffe3e4e6).withOpacity(1)
            )
            //pageDecoration,
            /*footer: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => Container(
                      color: Colors.green,
                    )),
                  );
                },
                child: Text('Get a Cut'),
              )*/
          ),
          PageViewModel(
            title: "Client",
            body: "Search and find the right shops and services",
            image: _buildImage('customer_state'),
            decoration: PageDecoration(
              pageColor: Color(0xffe2e3e4).withOpacity(1)
            ),

          ),
          PageViewModel(
            title: "Makeup",
            body: "Add a makeup shop,help enhance beauty",
            image: _buildImage('makeup_state'),
            decoration: PageDecoration(
                pageColor: Color(0xffd99673).withOpacity(0.7)
            ),
          ),
          PageViewModel(
            title: "Worker",
            body: "Enroll as a barber or hairdresser for shops to find",
            image: _buildImage('worker_state'),
            decoration: PageDecoration(
                pageColor: Color(0xffd1b0a1).withOpacity(0.1)
            ),
          ),
          PageViewModel(
            title: "Ready",
            //body: "Begin your experience💕",
            image: _buildImage('barbershop'),
            bodyWidget: SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder) {
                      return UserStatusSelectionScreen();
                    }));
                  },
                  child: Text("Begin")),
            ),
            decoration: PageDecoration(
                pageColor: Color(0xffd1b0a1).withOpacity(0.1)
            ),
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //call when introduction done
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        //show skip button, skip to last page
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('', style: TextStyle(fontWeight: FontWeight.w600)),
        //this is dot decoration
        dotsDecorator: DotsDecorator(
          //delete const if want to change active color
          activeColor: Color(0xFFBA68C8),
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
