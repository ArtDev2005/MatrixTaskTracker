import 'package:flutter/material.dart';
import 'package:matrix/theme/theme.dart';

import 'custom_widgets/custom_expansion_tile.dart';
import 'custom_widgets/rounded_widget.dart';
import 'custom_widgets/tabs.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inbox",
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 23, left: 16, right: 16),
        child: SingleChildScrollView(
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
      ),
    );
  }
}