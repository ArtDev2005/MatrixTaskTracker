import 'package:flutter/material.dart';
import 'package:matrix/create_new_project/progress_bar.dart';

import '../theme/theme.dart';
import 'new_project_invite_widget.dart';

class NewProjectTasksWidget extends StatefulWidget {
  final TextEditingController emailController;
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  NewProjectTasksWidget({super.key, required this.emailController});


  @override
  NewProjectTasksWidgetState createState() => NewProjectTasksWidgetState();
}

class NewProjectTasksWidgetState extends State<NewProjectTasksWidget> {

  InputDecoration decorate(String labelName, Icon icon){
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white)
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white)
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
      ),
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelName,
      contentPadding: EdgeInsets.only(left: 16),
      prefixIcon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    widget._controllers[0].text = widget.emailController.text;
    final data = <TextEditingController>[widget.emailController, ...widget._controllers];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            FittedBox(child: ProgressBarWidget(step: 2, nextScreen: NewProjectInviteWidget(data: data),)),
            Text("Your first Project",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16,),
            Text("What is your team working on now?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
                  fontSize: 20),
            ),
            SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(55)),
                  color: AppStyle.firstProjectCardColor
              ),
              width: 380,
              height: 318,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 26),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 56,
                    child: TextField(

                      style: TextStyle(color: Colors.white),
                      controller: widget._controllers[index],
                      enabled: index != 0 ? true : false,
                      decoration: index == 0 ?
                      decorate("Project name", Icon(Icons.image)) :
                      decorate("Task ${index}", Icon(Icons.check_circle_outline)) ,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}