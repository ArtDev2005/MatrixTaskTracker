import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:matrix/auth/auth.dart';
import 'package:matrix/auth/reg.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();

  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    print(deepLink.path);
    // Example of using the dynamic link to push the user to a different screen
    //Navigator.pushNamed(context, deepLink.path);
  }

  FirebaseDynamicLinks.instance.onLink.listen(
        (pendingDynamicLinkData) {
      // Set up the `onLink` event listener next as it may be received here
      if (pendingDynamicLinkData != null) {
        final Uri deepLink = pendingDynamicLinkData.link;
        // Example of using the dynamic link to push the user to a different screen
        //Navigator.pushNamed(context, deepLink.path);
      }
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Saira'),
      routes: {
        "/reg": (context) => Reg(),
        "/auth": (context) => Auth(),
      },
      initialRoute: "reg",
    );
  }
}
