import 'package:flutter/material.dart';
import 'package:matrix/create_new_project/progress_bar.dart';
import 'package:matrix/theme/theme.dart';

class NewProjectInviteWidget extends StatefulWidget {
  final List<TextEditingController> data;
  NewProjectInviteWidget({super.key, required this.data});
  final _inviteEmailController = TextEditingController();


  @override
  NewProjectInviteWidgetState createState() => NewProjectInviteWidgetState();
}

class NewProjectInviteWidgetState extends State<NewProjectInviteWidget> {

  InputDecoration decorate(String labelName, Icon icon, Color textColor){
    return InputDecoration(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white12),
      ),
      labelStyle: TextStyle(color: textColor),
      labelText: labelName,
      contentPadding: EdgeInsets.only(left: 16),
      prefixIcon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = <TextEditingController>[...widget.data, widget._inviteEmailController];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            children: [
              FittedBox(child: ProgressBarWidget(step: 3, nextScreen: NewProjectInviteWidget(data: data),)),
              Column(
                children: [
                  SizedBox(height: 16,),
                  Text(
                    "Who is working on this project?",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16,),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: decorate("Email", Icon(Icons.mail), Colors.white),
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppStyle.mainForegroundColor),
                    ),
                    onPressed: (){

                    },
                    child: Text("Invite from contacts", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 16,),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(text: "Read more in our "),
                          TextSpan(text: "Privacy Policy",
                              style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ]
                    ),
                  )

                ],
              )
            ]
        ),
      ),
    );
  }
}