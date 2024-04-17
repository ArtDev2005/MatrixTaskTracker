import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matrix/theme/theme.dart';

class MakeNewTaskScreen extends StatefulWidget {
  const MakeNewTaskScreen({super.key});

  @override
  State<MakeNewTaskScreen> createState() => _MakeNewTaskScreenState();
}

class _MakeNewTaskScreenState extends State<MakeNewTaskScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.arrow_back_ios_outlined, color: AppStyle.lightBlue,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.check_circle_outline, color: AppStyle.lightBlue,),
            SizedBox(width: 16,),
            Icon(Icons.link, color: AppStyle.lightBlue,),
            SizedBox(width: 16,),
            Icon(Icons.more_vert_sharp, color: AppStyle.lightBlue)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Task Name",
        
                ),
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Flexible(flex: 1, child: ExecutorDataWidget()),
                  Flexible(flex: 1, child: MyTasksWidget())
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Flexible(flex: 1, child: DateWidget()),
                  Flexible(flex: 1, child: AddProjectWidget())
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 23),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur "
                "adipiscing elit, sed do eiusmod tempor incididunt "
                "ut labore et dolore magna aliqua.",
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        height: 56,
                        color: AppStyle.mainForegroundColor,
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: AppStyle.lightBlue,),
                            SizedBox(width: 16,),
                            Text("List item Name", style: Theme.of(context).primaryTextTheme.bodyMedium),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: double.infinity,
                            height: 56,
                            color: AppStyle.mainForegroundColor,
                            child: Row(
                              children: [
                                Icon(Icons.add_circle, color: Colors.white,),
                                SizedBox(width: 16,),
                                Text("Add list item", style: Theme.of(context).primaryTextTheme.bodyMedium),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: (){},
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Attachment",
                  style: Theme.of(context).primaryTextTheme.bodyMedium
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 23),
                child: Row(
                  children: [
                    Container(
        
                      width: 53,
                      height: 53,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class ExecutorDataWidget extends StatelessWidget {
  const ExecutorDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 20,),
        SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Executor", style: Theme.of(context).primaryTextTheme.bodyMedium,),
            Text("Artem", style: Theme.of(context).primaryTextTheme.bodyMedium,),
          ],
        )
      ],
    );
  }
}

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 12, top: 12),
          child: Icon(Icons.calendar_month, color: AppStyle.lightBlue,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Deadline", style: Theme.of(context).primaryTextTheme.bodyMedium,),
            Text("March 20th", style: Theme.of(context).primaryTextTheme.bodyLarge,),
          ],
        ),
      ],
    );
  }
}

class MyTasksWidget extends StatefulWidget {
  const MyTasksWidget({super.key});

  @override
  State<MyTasksWidget> createState() => _MyTasksWidgetState();
}

class _MyTasksWidgetState extends State<MyTasksWidget> {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My tasks", style: Theme.of(context).primaryTextTheme.bodyMedium,),
            Text("Recently Appointed", style: Theme.of(context).primaryTextTheme.bodyLarge,),
          ],
        ),
      ],
    );
  }
}

class AddProjectWidget extends StatefulWidget {
  const AddProjectWidget({super.key});

  @override
  State<AddProjectWidget> createState() => _AddProjectWidgetState();
}

class _AddProjectWidgetState extends State<AddProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Project", style: Theme.of(context).primaryTextTheme.bodyMedium,),
        Stack(
          children: [
            Row(
              children: [
                Icon(Icons.add_circle, color: AppStyle.lightBlue,),
                SizedBox(width: 8,),
                Text("Add project", style: Theme.of(context).primaryTextTheme.bodyMedium,)
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){},
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
