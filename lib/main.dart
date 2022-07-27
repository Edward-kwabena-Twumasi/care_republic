import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thecut/models/job_model.dart';
import 'package:thecut/models/notification_model.dart';
import 'package:thecut/providers/app_provider.dart';
import 'package:thecut/providers/client_provider.dart';
import 'package:thecut/providers/shop_provider.dart';
import 'package:thecut/providers/worker_provider.dart';
import 'package:thecut/screens/orientation/onboarding_screen.dart';
import 'package:thecut/screens/orientation/splash_screen.dart';
import 'package:thecut/screens/shop/notification/shop_notification_list_screen.dart';

import 'providers/job_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => WorkerProvider()),
        ChangeNotifierProvider(create: (context) => ShopProvider()),
        ChangeNotifierProvider(create: (context) => ClientProvider()),
        ChangeNotifierProvider(create: (context) => JobProvider()),
      ],
      child: Builder(builder: (context) {
        return ScreenUtilInit(
          child: SafeArea(
            child: MaterialApp(
              title: "theCut",
              home: AnimatedSplashScreen(
                splashIconSize: 120.0,
                duration: 4000,
                nextScreen: /*DefaultNotificationScreen(
                    notificationDetails: Notification(
                        '123',
                        'GENERAL',
                        DateTime.now(),
                        true,
                        {},
                        null,
                        Job.fromJson({
                          'uid': '131',
                          'title': 'Experienced Barber with Soft skills Needed',
                          'is_vacant': true,
                          'description':
                              "We are looking for skilled barbers living around Ayeduase and its immediate environs to occupy vacant positions.  We expect barbers to have completed SHS and must be able to have command over English language",
                          'date': DateTime.now(),
                          'worker_type': 'Barber'
                        })))*/ OnBoardingScreen(),
                splash: SplashScreen(),
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: Colors.black,
              ),
              debugShowCheckedModeBanner: false,
            ),
          ),
        );
      }),
    );
  }
}
