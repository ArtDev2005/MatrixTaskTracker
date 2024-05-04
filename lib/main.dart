import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:matrix/auth/auth.dart';
import 'package:matrix/create_first_project/first_project_screen.dart';
import 'package:matrix/main_screen.dart';
import 'package:matrix/reg/reg.dart';
import 'package:matrix/theme/theme.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final key = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final ThemeData base = ThemeData.dark();
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (BuildContext context) => Icon(Icons.arrow_back_ios_new, color: AppStyle.lightBlue,),
        ),
        primaryTextTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
            )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(

          backgroundColor: AppStyle.mainForegroundColor,
          unselectedItemColor: Colors.blue,
          selectedItemColor: Colors.white
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppStyle.mainBackgroundColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor: MaterialStatePropertyAll(AppStyle.mainButtonColor)
          )
        ),
        scaffoldBackgroundColor: AppStyle.mainBackgroundColor,
        fontFamily: 'Saira',

      ),
      routes: {
        "/reg": (context) => Reg(),
        //"/auth": (context) => Auth(),
        "/reg/first_project_screen": (context) => FirstProjectScreen(),
        "/": (context) => MainScreen()
      },
      //initialRoute: "/reg",

    );
  }
}
