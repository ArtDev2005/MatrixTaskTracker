import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrix/theme/theme.dart';

double multiplier = 1;

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

  void callback(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Inherit(
        child: Column(
          children: [
            _ProgressBarWidget(callback: callback,),
            SizedBox(height: 16,),
            ViewStep()
          ],
        ),
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
        borderSide: const BorderSide(color: Colors.white24),
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
    return Column(
      children: [
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
        borderSide: const BorderSide(color: Colors.white24),
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
    return Column(
      children: [
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
                  enabled: index != 0 ? true : false,
                  decoration: index == 0 ?
                  decorate("Project name", Icon(Icons.image), Colors.white12, ) :
                  decorate("Task ${index}", Icon(Icons.check_circle_outline), Colors.white) ,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
          ),
        ),
      ],
    );
  }
}


class _NewProjectInviteWidget extends StatefulWidget {
  const _NewProjectInviteWidget({super.key});

  @override
  _NewProjectInviteWidgetState createState() => _NewProjectInviteWidgetState();
}

class _NewProjectInviteWidgetState extends State<_NewProjectInviteWidget> {

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            "Who is working on this project?",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)
          ),
          SizedBox(height: 16,),
          TextField(
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
                TextSpan(text: "Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold)),
              ]
            ),
          )
        ],
      ),
    );
  }
}


class _ProgressBarWidget extends StatefulWidget {
  final Function callback;
  const _ProgressBarWidget({super.key, required this.callback});

  @override
  State<_ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<_ProgressBarWidget> {
  //double multiplier = 1;
  @override
  Widget build(BuildContext context) {
    final data = Inherit.of(context);
    print(multiplier);
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
                width: data.progressBarFilledSpace * multiplier,
                height: 4,
                color: AppStyle.mainForegroundColor,
              ),
            ],
          ),
          SizedBox(width: 20,),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppStyle.mainForegroundColor)),
            onPressed: (){
              if (multiplier < data.contents.length){
                multiplier += 1;
              }
              widget.callback();
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

class Inherit extends InheritedWidget {
  final List<Widget> contents = [
    _NewProjectNameCardWidget(),
    _NewProjectTasksCardWidget(),
    _NewProjectInviteWidget(),
  ];
  final progressBarFilledSpace = 70;
  Inherit({
    super.key,
    required Widget child,
  }) : super(child: child);

  static Inherit of(BuildContext context) {
    final Inherit? result = context.dependOnInheritedWidgetOfExactType<Inherit>();
    assert(result != null, 'No Inherit found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Inherit old) {
    return true;
  }
}

class ViewStep extends StatefulWidget {
  const ViewStep({super.key});

  @override
  State<ViewStep> createState() => _ViewStepState();
}

class _ViewStepState extends State<ViewStep> {
  @override
  Widget build(BuildContext context) {
    final data = Inherit.of(context);

    return data.contents[multiplier.toInt() - 1];
  }
}
