import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thecut/providers/client_provider.dart';
import 'package:thecut/providers/provider.dart';
import 'package:thecut/providers/shop_provider.dart';
import 'package:thecut/providers/worker_provider.dart';
import 'package:thecut/screens/orientation/onboarding_screen.dart';
import 'package:thecut/screens/orientation/splash_screen.dart';

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
        ChangeNotifierProvider(create: (context) => ApplicationProvider()),
        ChangeNotifierProvider(create: (context) => WorkerProvider()),
        ChangeNotifierProvider(create: (context) => ShopProvider()),
        ChangeNotifierProvider(create: (context) => ClientProvider()),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            child: MaterialApp(
              title: "theCut",
              home: AnimatedSplashScreen(
                splashIconSize: 120.0,
                duration: 4000,
                nextScreen: OnBoardingScreen(),
                splash: SplashScreen(),
                splashTransition: SplashTransition.slideTransition,
                backgroundColor: Colors.black,
              ),
              debugShowCheckedModeBanner: false,
            ),
          );
        }
      ),
    );
  }
}
