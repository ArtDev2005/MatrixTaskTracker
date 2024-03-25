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

  List<bool> textFieldsStates = List.filled(4, false);

  void callback(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _NewProjectNameCardWidget()
    );
  }
}

class _NewProjectNameCardWidget extends StatefulWidget {
  const _NewProjectNameCardWidget({super.key});

  @override
  State<_NewProjectNameCardWidget> createState() => _NewProjectNameCardWidgetState();
}

class _NewProjectNameCardWidgetState extends State<_NewProjectNameCardWidget> {

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
      body: Column(
        children: [
          ProgressBarWidget(step: 1, nextScreen: _NewProjectTasksCardWidget(emailController: _emailController,),),
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
    );
  }
}


class _NewProjectTasksCardWidget extends StatefulWidget {
  final TextEditingController emailController;
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  _NewProjectTasksCardWidget({super.key, required this.emailController});


  @override
  _NewProjectTasksCardWidgetState createState() => _NewProjectTasksCardWidgetState();
}

class _NewProjectTasksCardWidgetState extends State<_NewProjectTasksCardWidget> {

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
      body: Column(
        children: [
          ProgressBarWidget(step: 2, nextScreen: _NewProjectInviteWidget(data: data),),
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
    );
  }
}


class _NewProjectInviteWidget extends StatefulWidget {
  final List<TextEditingController> data;
  _NewProjectInviteWidget({super.key, required this.data});
  final _inviteEmailController = TextEditingController();


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

  @override
  Widget build(BuildContext context) {
    final data = <TextEditingController>[...widget.data, widget._inviteEmailController];
    //print("asdsadasdsaddddddddddddddddddddddddddd${data}");
    return Scaffold(
      body: Column(
        children: [
          ProgressBarWidget(step: 3, nextScreen: _NewProjectInviteWidget(data: data,),),
          SizedBox(height: 16,),
          Padding(
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
          )
        ],
      ),
    );
  }
}


class ProgressBarWidget extends StatefulWidget {
  final int step;
  final Widget nextScreen;
  const ProgressBarWidget({super.key, required this.step, required this.nextScreen});

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 230,
                  height: 4,
                  color: AppStyle.linearProgressBarColor,
                ),
                Container(
                  width: 80 * widget.step.toDouble(),
                  height: 4,
                  color: AppStyle.mainForegroundColor,
                ),
              ],
            ),
            SizedBox(width: 20,),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppStyle
                      .mainForegroundColor)),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(

                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,){
                      return widget.nextScreen;
                    },
                    transitionsBuilder: (
                        BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      final tween = Tween(begin: begin, end: end);
                      final offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 200),

                  ),
                );
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
