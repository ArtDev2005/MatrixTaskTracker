import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:matrix/auth/auth.dart';
import 'package:matrix/reg/first_project_screen.dart';
import 'package:matrix/reg/reg.dart';
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
      theme: ThemeData(fontFamily: 'Saira'),
      routes: {
        "/reg": (context) => Reg(emailLink: this.emailLink),
        "/auth": (context) => Auth(),
        "/reg/first_project_screen": (context) => FirstProjectScreen(),
      },
      initialRoute: "/reg",
    );
  }
}
