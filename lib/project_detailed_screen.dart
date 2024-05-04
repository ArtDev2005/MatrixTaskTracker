import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrix/custom_widgets/custom_expansion_tile.dart';
import 'package:matrix/custom_widgets/rounded_widget.dart';
import 'package:matrix/custom_widgets/painters.dart';
import 'package:matrix/resources/resources.dart';
import 'package:matrix/theme/theme.dart';

import 'custom_widgets/tabs.dart';
import 'make_new_task_screen.dart';

class ProjectDetailedScreen extends StatefulWidget {
  final Color projectColor;
  final String projectName;
  const ProjectDetailedScreen(
    {
      super.key,
      required this.projectColor,
      required this.projectName,
    }
  );

  @override
  State<ProjectDetailedScreen> createState() => _ProjectDetailedScreenState();
}

class _ProjectDetailedScreenState extends State<ProjectDetailedScreen> {
  //bool _isExpanded = false;
  // List<bool> ExpPanelToggles = [
  //   false, false, false, false
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: CustomPaint(
                    painter: CirclePainter(color: widget.projectColor),
                  ),
                ),
                SizedBox(width: 16,),
                Text(
                  widget.projectName,
                  style: Theme.of(context).primaryTextTheme.titleLarge,
                ),
              ],
            ),
            Text(
                "Tasks",
                style: Theme.of(context).primaryTextTheme.titleLarge
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 23, right: 16, left: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: RoundedWidget(
                  radius: 20,
                  children: [
                    CustomExpansionTile(
                      title: "Recently Appointed",
                      children: [
                        TaskTab(
                          name: "Task 1",
                          date: "March 14th",
                          showDate: true,
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 2",
                          date: "March 14th",
                          showDate: true,
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 3",
                          date: "March 14th",
                          showDate: true,
                        )
                      ],
                    ),
                    CustomExpansionTile(
                      title: "Today",
                      children: [
                        TaskTab(
                          name: "Task 1",
                          date: "March 14th",
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 2",
                          date: "March 14th",
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 3",
                          date: "March 14th",
                        )
                      ],
                    ),
                    CustomExpansionTile(
                      title: "Next week",
                      children: [
                        TaskTab(
                          name: "Task 1",
                          date: "March 14th",
                          showDate: true,
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 2",
                          date: "March 14th",
                          showDate: true,
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 3",
                          date: "March 14th",
                          showDate: true,
                        )
                      ],
                    ),
                    CustomExpansionTile(
                      title: "Later",
                      children: [
                        TaskTab(
                          name: "Task 1",
                          date: "March 14th",
                          showDate: true,
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 2",
                          date: "March 14th",
                          showDate: true,
                        ),
                        Divider(color: AppStyle.darkGrey, height: 1,),
                        TaskTab(
                          name: "Task 3",
                          date: "March 14th",
                          showDate: true,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        PageRouteBuilder(

                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,){
                            return MakeNewTaskScreen();
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
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 8,),
                        Text("New Task")
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),

                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
