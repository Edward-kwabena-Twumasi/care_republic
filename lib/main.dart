import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:thecut/providers/provider.dart';
import 'package:thecut/screens/orientation/user_status_selection_screen.dart';
import 'package:thecut/testing/client_registration_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApplicationProvider(),
        child: ScreenUtilInit(
          child: MaterialApp(title: 'theCut',
            home: UserStatusSelectionScreen(),
          ),
        )
    );
  }
}
