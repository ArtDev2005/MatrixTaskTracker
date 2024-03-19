import 'package:flutter/material.dart';
import 'package:matrix/theme/theme.dart';

class FirstProjectScreen extends StatefulWidget {
  FirstProjectScreen({super.key});

  @override
  State<FirstProjectScreen> createState() => _FirstProjectScreenState();
}

class _FirstProjectScreenState extends State<FirstProjectScreen> {
  final textFieldDecorator = InputDecoration(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.white),
    labelText: "Project name",
    contentPadding: EdgeInsets.only(left: 16),
  );

  final listControllers = List.filled(4, TextEditingController());
  /*final first = FocusNode();
  final second = FocusNode();
  final third = FocusNode();
  final fourth = FocusNode();*/
  final listFocusNodes = [];

  double progressBarFilledSpace = 70;
  int multiplier = 1;

  InputDecoration decorate(String labelName, Icon icon){
    return InputDecoration(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelName,
      contentPadding: EdgeInsets.only(left: 16),
      prefixIcon: icon,
    );
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < listFocusNodes.length; i++){
      listFocusNodes[i].addListener(() {
        print("Has focus: ${listFocusNodes[i].hasFocus}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /*listFocusNodes.add(first);
    listFocusNodes.add(second);
    listFocusNodes.add(first);
    listFocusNodes.add(second);*/
    return Scaffold(
      backgroundColor: AppStyle.mainBackgroundColor,
      body: Column(
        children: [
          Padding(
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
                      width: progressBarFilledSpace * multiplier,
                      height: 4,
                      color: AppStyle.mainForegroundColor,
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppStyle.mainForegroundColor)),
                  onPressed: (){},
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Text("Your first Project",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 16,),
          Text("What is your team working on now?",
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
                    ///**/focusNode: listFocusNodes[index],
                    controller: listControllers[index],
                    decoration: index == 0 ?
                    decorate("Project name", Icon(Icons.image)) :
                    decorate("Task ${index}", Icon(Icons.check_circle_outline)) ,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
            ),
          )
        ],
      )
    );
  }
}

/*Column(
                children: [
                  TextField(
                    decoration: decorate("Project name"),
                  ),
                  TextField(
                    decoration: decorate("Task 1"),
                  ),
                  TextField(
                    decoration: decorate("Task 2"),
                  ),
                  TextField(
                    decoration: decorate("Task 3"),
                  )
                ],*/