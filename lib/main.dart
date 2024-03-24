import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:matrix/auth/auth.dart';
import 'package:matrix/reg/first_project_screen.dart';
import 'package:matrix/reg/reg.dart';
import 'package:matrix/theme/theme.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final PendingDynamicLinkData? emailLink = await FirebaseDynamicLinks.instance.getInitialLink();


  runApp(MyApp(emailLink: emailLink));
}

class MyApp extends StatelessWidget {
  final emailLink;
  const MyApp({super.key, required this.emailLink});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyle.mainBackgroundColor,
        primaryTextTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)
        ),
        primaryColor: AppStyle.mainBackgroundColor,
        fontFamily: 'Saira',
      ),
      routes: {
        "/reg": (context) => Reg(emailLink: this.emailLink),
        //"/auth": (context) => Auth(),
        "/reg/first_project_screen": (context) => FirstProjectScreen(),
      },
      initialRoute: "/reg",

    );
  }
}

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({super.key});

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 75, left: 20),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 280,
                  height: 4,
                  color: AppStyle.linearProgressBarColor,
                ),
                Container(
                  width: 70,
                  height: 4,
                  color: AppStyle.mainForegroundColor,
                ),
              ],
            ),
            SizedBox(width: 20,),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppStyle
                      .mainForegroundColor)),
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )
    );
  }
}
