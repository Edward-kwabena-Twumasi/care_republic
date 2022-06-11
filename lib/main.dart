import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:thecut/providers/provider.dart';
import 'package:thecut/screens/client/client_main_screen.dart';
import 'package:thecut/screens/orientation/onboarding_screen.dart';
import 'package:thecut/screens/orientation/user_status_selection_screen.dart';
import 'package:thecut/testing/stepper_tester.dart';
import 'package:thecut/theme/custom_theme.dart';

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
        /*   theme: ThemeData(
              primaryColor: colorScheme.primary,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      primary: colorScheme.secondary,
                      elevation: 5,
                      shape: StadiumBorder(),
                      textStyle: textTheme.button?.copyWith(
                          color: colorScheme.onSecondary)
                  )
              ),
              iconTheme: IconThemeData(
                  color: colorScheme.primary

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: colorScheme.secondary,
                selectedIconTheme: IconThemeData(
                    color: colorScheme.secondary
                ),
                selectedLabelStyle: TextStyle(
                  color: colorScheme.secondary,

                ),
                unselectedIconTheme: IconThemeData(
                    color: Colors.black54
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorScheme.primaryContainer)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              appBarTheme: AppBarTheme(backgroundColor: colorScheme.primary),
              textTheme: textTheme,
              colorScheme: colorScheme.copyWith(
                  secondary: colorScheme.secondary),
              //fontFamily: 'Kuro',
              // floatingActionButtonTheme: const FloatingActionButtonThemeData(
              //     backgroundColor: Colors.white,
              //     foregroundColor: colorScheme.secondary)

            ),*/
            home: StepperTester(),
          ),

        )
    );
  }
}
