import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrix/painters.dart';
import 'package:matrix/resources/resources.dart';
import 'package:matrix/theme/theme.dart';

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
  bool _isExpanded = false;
  List<bool> ExpPanelToggles = [
    false, false, false, false
  ];

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
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                CustomExpansionTile(title: "Recently Appointed",),
                CustomExpansionTile(title: "Today",),
                CustomExpansionTile(title: "Next week",),
                CustomExpansionTile(title: "Later",),
              ],
            ),
          ),
        ),
      )
    );
  }
}


class TaskTab extends StatefulWidget {
  final String taskName;
  final String deadline;
  const TaskTab(
      {
        super.key,
        required this.taskName,
        required this.deadline,
      }
  );

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppStyle.mainForegroundColor,
          width: double.infinity,
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Images.tickCircleLinear),
                    SizedBox(width: 16,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          this.widget.taskName,
                          style: Theme.of(context).primaryTextTheme.titleMedium,
                        ),
                        Text(
                          this.widget.deadline,
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
                Icon(Icons.arrow_right, color: Colors.white,)
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){

              },
            ),
          ),
        )
      ],
    );
  }
}


class CustomExpansionTile extends StatefulWidget {
  final String title;
  const CustomExpansionTile({super.key, required this.title});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        trailing: Stack(
          children: [
            Icon(Icons.more_horiz, size: 32, color: AppStyle.lightBlue,),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        enableDrag: true,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                          ),
                        ),
                        backgroundColor: AppStyle.darkGrey,
                        context: context,
                        builder: (context){
                          return Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    width: 32,
                                    height: 4,

                                  ),
                                ),
                              ),
                              ListTile(
                                  leading: Icon(Icons.edit, color: AppStyle.lightBlue,),
                                  title: Text("Check section title", style: Theme.of(context).primaryTextTheme.bodyMedium,)
                              ),
                              ListTile(
                                  leading: Icon(Icons.add_circle_outlined, color: AppStyle.lightBlue,),
                                  title: Text("Add new section", style: Theme.of(context).primaryTextTheme.bodyMedium,)
                              ),
                              ListTile(
                                  leading: Icon(Icons.cancel, color: AppStyle.lightBlue,),
                                  title: Text("Delete section", style: Theme.of(context).primaryTextTheme.bodyMedium,)
                              )
                            ],
                          );
                        }
                    );
                  },
                ),
              ),
            )
          ],
        ),
        tilePadding: EdgeInsets.only(left: 8, right: 16),
        backgroundColor: AppStyle.darkGrey,
        collapsedBackgroundColor: AppStyle.darkGrey,
        controlAffinity: ListTileControlAffinity.platform,
        leading: Icon(Icons.arrow_drop_down_rounded, size: 48, color: Colors.white,),
        title: Text(
          this.widget.title,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
        children: [
          TaskTab(taskName: "Task 1", deadline: "March 17th",),
          Divider(color: AppStyle.darkGrey, height: 1,),
          TaskTab(taskName: "Task 2", deadline: "Today",),
          Divider(color: AppStyle.darkGrey, height: 1,),
          TaskTab(taskName: "Task 3", deadline: "April 23th",),
        ],
      ),
    );
  }
}
