import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrix/create_new_project/progress_bar.dart';

import '../custom_widgets/text_field_widget.dart';
import '../resources/resources.dart';
import '../theme/theme.dart';
import 'new_project_tasks_widget.dart';

class NewProjectNameWidget extends StatefulWidget {
  const NewProjectNameWidget({super.key});

  @override
  State<NewProjectNameWidget> createState() => NewProjectNameWidgetState();
}

class NewProjectNameWidgetState extends State<NewProjectNameWidget> {

  final TextEditingController _emailController = TextEditingController();

  InputDecoration decorateTextFields(String labelName, SvgPicture icon, Color textColor){
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

  Widget getTextFields()
  {
    List<Widget> list = [];
    for(int index = 0; index < 4; index++){
      if (index == 0){
        list.add(
            CustomTextField(
              enabled: true,
              iconPath: Images.picture,
              labelText: "Project name",
              color: Colors.white,
            )
        );
      }
      else{
        list.add(
            CustomTextField(
              enabled: false,
              iconPath: Images.tickCircleLinear,
              labelText: "Task ${index}",
              color: Colors.white24,
            )
        );
      }

      if (index < 3){
        list.add(
            SizedBox(height: 10,)
        );
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
      child: Column(children: list),
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
              child: getTextFields()
            ),
          ],
        ),
      ),
    );
  }
}