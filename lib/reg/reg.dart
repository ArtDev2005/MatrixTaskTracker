import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matrix/resources/resources.dart';
import 'package:matrix/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matrix/firebase_options.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Reg extends StatelessWidget {
  final emailLink;
  const Reg({super.key, required this.emailLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(Images.matrixLogo),
            SizedBox(height: 35,),
            _FormWidget(emailLink: this.emailLink),
            SizedBox(height: 39,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                  "Already use MATRIX?"
                ),
                TextButton(
                  onPressed: (){
                    final nav = Navigator.of(context);
                    nav.pushReplacementNamed("/auth");
                  },
                  child: Text("Log in.", style: TextStyle(color: AppStyle.mainForegroundColor),),
                )
              ],
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By continuing, you agree to the ',
                style: Theme.of(context).primaryTextTheme.bodyMedium,
                children: const <TextSpan>[
                  TextSpan(text: 'Terms of Service ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "and"),
                  TextSpan(text: ' Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _FormWidget extends StatefulWidget {
  final emailLink;
  _FormWidget({super.key, required this.emailLink});


  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {

  final buttonStyle = OutlinedButton.styleFrom(
      side: BorderSide(width: 1.0, color: Colors.white)
  );

  final textFieldDecorator = InputDecoration(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.white),
    labelText: "Email",
    contentPadding: EdgeInsets.only(left: 16),
  );

  final TextEditingController _emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailLink(userEmail)async{
    var _userEmail = userEmail;
    return await _auth.sendSignInLinkToEmail(
        email: _userEmail,
        actionCodeSettings: ActionCodeSettings(
          url: "https://matrixtasktracker.page.link/main",
          handleCodeInApp: true,
          androidPackageName:"com.example.matrix_task_tracker",
          androidMinimumVersion: "1",
        )
    ).catchError((onError) => print('Error sending email verification $onError')).then((value){
      print("email sent");
    });
  }

  Future<void> reg() async {
    signInWithEmailLink(_emailController.text);
    getLink();
  }

  void getLink() async {
    try {
      if (FirebaseAuth.instance.isSignInWithEmailLink(widget.emailLink!.link.path)) {
        // The client SDK will parse the code from the link for you.
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailLink(email: _emailController.text, emailLink: widget.emailLink.link.path);

        // You can access the new user via userCredential.user.
        final emailAddress = userCredential.user?.email;

        print('Successfully signed in with email link!');}}
    catch (error) {
      print('Error signing in with email link.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton(
          style: buttonStyle,
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                height: 18,
                width: 18,
                Images.iconGoogle
              ),
              SizedBox(width: 8,),
              Text("Sign in with Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),)
            ],
          ),
        ),
        SizedBox(height: 39,),
        TextField(
          controller: _emailController,
          style: TextStyle(color: Colors.white),
          decoration: textFieldDecorator,
        ),
        SizedBox(height: 39,),
        ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppStyle.mainForegroundColor)),
            onPressed: (){
              Navigator.of(context).pushNamed("/reg/first_project_screen");
              //reg();
            },
            child: Text("Create account", style: TextStyle(color: Colors.white),)
        ),
      ],
    );
  }
}
