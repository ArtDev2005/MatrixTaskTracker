import 'package:flutter/material.dart';
import 'package:matrix/create_new_project/progress_bar.dart';

import '../theme/theme.dart';
import 'new_project_tasks_widget.dart';

class NewProjectNameWidget extends StatefulWidget {
  const NewProjectNameWidget({super.key});

  @override
  State<NewProjectNameWidget> createState() => NewProjectNameWidgetState();
}

class NewProjectNameWidgetState extends State<NewProjectNameWidget> {

  final TextEditingController _emailController = TextEditingController();

  InputDecoration decorate(String labelName, Icon icon, Color textColor){
    return InputDecoration(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white24),
      ),
      labelStyle: TextStyle(color: textColor),
      labelText: labelName,
      contentPadding: EdgeInsets.only(left: 16),
      prefixIcon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            FittedBox(child: ProgressBarWidget(step: 1, nextScreen: NewProjectTasksWidget(emailController: _emailController,),)),
            Text("Your first Project",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
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
                      controller: index == 0 ? _emailController : null,
                      style: TextStyle(color: Colors.white),
                      enabled: index == 0 ? true : false,
                      decoration: index == 0 ?
                      decorate("Project name", Icon(Icons.image), Colors.white, ) :
                      decorate("Task ${index}", Icon(Icons.check_circle_outline), Colors.white24) ,
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