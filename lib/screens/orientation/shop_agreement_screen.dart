import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:thecut/providers/include_provider.dart';
import 'package:thecut/providers/shop_provider.dart';
import 'package:thecut/scaling/scaler.dart';
import 'package:thecut/screens/shop/shop_main_screen.dart';

class ShopAgreementScreen extends StatefulWidget {
  const ShopAgreementScreen({Key? key}) : super(key: key);

  @override
  _ShopAgreementScreenState createState() => _ShopAgreementScreenState();
}

class _ShopAgreementScreenState extends State<ShopAgreementScreen> {
  ScrollController markdownScrollController = ScrollController();

  // bool showAgreeButton=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    markdownScrollController.addListener(() {
      print(markdownScrollController.position);
    });
  }

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer(context: context, hasAppBar: true, hasBottomNav: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agree with our terms?"),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            ShopProvider shopProvider=provider(context,type: 'shop');
            shopProvider.collection().doc(shopProvider.tempShopDetails['uid']).set(shopProvider.tempShopDetails).then((value){
              print("Shop Added Successfully to Firebase");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_){
                return const ShopMainScreen();
              }), (route) => false);
            });

          },
          child: const Text('I Agree'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: size.cw(10),vertical: size.cw(3)),
            primary: Colors.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )),
      body: FutureBuilder<String>(
        future: Future.delayed(Duration(milliseconds: 150)).then((value) {
          return rootBundle.loadString('assets/term_and_conditions.md');
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(bottom: size.ch(5)),
              child: Markdown(
                controller: markdownScrollController,
                data: snapshot.data!,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
