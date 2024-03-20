import 'package:flutter/material.dart';
import 'package:matrix/resources/resources.dart';
import 'package:matrix/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matrix/firebase_options.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Auth extends StatelessWidget {
  Auth({super.key});

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
            Image.asset("assets/images/matrix_logo.png"),
            SizedBox(height: 35,),
            _FormWidget(),
            SizedBox(height: 39,),
            Text(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                "By continuing, you agree to the Terms of Service and Privacy Policy"
            )
          ],
        ),
      ),
    );
  }
}


class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final textFieldDecorator = InputDecoration(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.white),
    labelText: "Email",
    contentPadding: EdgeInsets.only(left: 16),
  );
  final buttonStyle = OutlinedButton.styleFrom(
      side: BorderSide(width: 1.0, color: Colors.white)
  );

  final TextEditingController _emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailLink(userEmail)async{
    var _userEmail=userEmail;
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
              Image.asset("assets/images/google_icon.png"),
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
              reg();
            },
            child: Text("Continue", style: TextStyle(color: Colors.white),)
        ),
      ],
    );
  }
}
