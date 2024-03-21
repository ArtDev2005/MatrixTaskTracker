import 'package:flutter/material.dart';
import 'package:matrix/theme/theme.dart';

ProgressBarData data = ProgressBarData();

class FirstProjectScreen extends StatefulWidget {
  FirstProjectScreen({super.key});

  @override
  State<FirstProjectScreen> createState() => _FirstProjectScreenState();
}

class _FirstProjectScreenState extends State<FirstProjectScreen> {
  List<Widget> contents = [_NewProjectNameCardWidget(), _NewProjectTasksCardWidget()];

  final textFieldDecorator = InputDecoration(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.white),
    labelText: "Project name",
    contentPadding: EdgeInsets.only(left: 16),
  );

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {

    });
  }
  InputDecoration decorate(String labelName, Icon icon){
    return InputDecoration(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelName,
      contentPadding: EdgeInsets.only(left: 16),
      prefixIcon: icon,
    );
  }

  var con;

  @override
  void initState() {
    super.initState();
    con = getControllers();
  }

  List<TextEditingController> getControllers(){
    List<TextEditingController> con = [];
    for (int i = 0; i < 4; i++){
      TextEditingController c = TextEditingController();
      con.add(c);
    }
    return con;
  }

  List<bool> textFieldsStates = List.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      width: data.progressBarFilledSpace * data.multiplier,
                      height: 4,
                      color: AppStyle.mainForegroundColor,
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppStyle.mainForegroundColor)),
                  onPressed: (){
                    if (data.multiplier < 4){
                      data.multiplier += 1;
                    }

                    setState(() {

                    });
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
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
          contents[data.multiplier.toInt() - 1],
        ],
      )
    );
  }
}

class _NewProjectNameCardWidget extends StatefulWidget {
  const _NewProjectNameCardWidget({super.key});

  @override
  State<_NewProjectNameCardWidget> createState() => _NewProjectNameCardWidgetState();
}

class _NewProjectNameCardWidgetState extends State<_NewProjectNameCardWidget> {

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
  var con;


  @override
  void initState() {
    super.initState();
    con = getControllers();
  }

  List<TextEditingController> getControllers(){
    List<TextEditingController> con = [];
    for (int i = 0; i < 4; i++){
      TextEditingController c = TextEditingController();
      con.add(c);
    }
    return con;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              enabled: index == 0 ? true : false,
              decoration: index == 0 ?
              decorate("Project name", Icon(Icons.image), Colors.white, ) :
              decorate("Task ${index}", Icon(Icons.check_circle_outline), Colors.white12) ,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
      ),
    );
  }
}


class _NewProjectTasksCardWidget extends StatefulWidget {
  const _NewProjectTasksCardWidget({super.key});

  @override
  _NewProjectTasksCardWidgetState createState() => _NewProjectTasksCardWidgetState();
}

class _NewProjectTasksCardWidgetState extends State<_NewProjectTasksCardWidget> {

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
  var con;


  @override
  void initState() {
    super.initState();
    con = getControllers();
  }

  List<TextEditingController> getControllers(){
    List<TextEditingController> con = [];
    for (int i = 0; i < 4; i++){
      TextEditingController c = TextEditingController();
      con.add(c);
    }
    return con;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              enabled: index != 0 ? true : false,
              decoration: index == 0 ?
              decorate("Project name", Icon(Icons.image), Colors.white12, ) :
              decorate("Task ${index}", Icon(Icons.check_circle_outline), Colors.white) ,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
      ),
    );
  }
}


class _ProgressBarWidget extends StatefulWidget {
  const _ProgressBarWidget({super.key});

  @override
  State<_ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<_ProgressBarWidget> {
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
                width: data.progressBarFilledSpace * data.multiplier,
                height: 4,
                color: AppStyle.mainForegroundColor,
              ),
            ],
          ),
          SizedBox(width: 20,),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppStyle.mainForegroundColor)),
            onPressed: (){
              if (data.multiplier < 4){
                data.multiplier += 1;
              }

              setState(() {

              });
            },
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

class ProgressBarData{
  final progressBarFilledSpace = 70;
  double multiplier = 1;
}