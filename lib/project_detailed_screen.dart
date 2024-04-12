import 'package:flutter/material.dart';
import 'package:matrix/theme/theme.dart';

class ProjectDetailedScreen extends StatefulWidget {
  const ProjectDetailedScreen({super.key});

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //SvgPicture.asset(Images.picture),
                //SizedBox(width: 16,),
                Text(
                  "VAL",
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
        padding: const EdgeInsets.only(top: 23, left: 16, right: 16),
        child: Column(
          children: [
            ExpansionPanelList(
              expandIconColor: Colors.white,
              expansionCallback: (panelIndex, isExpanded) {
                ExpPanelToggles[panelIndex] = !ExpPanelToggles[panelIndex];
                setState(() {

                });
              },
              children: [
                ExpansionPanel(
                  backgroundColor: AppStyle.darkGrey,
                  isExpanded: ExpPanelToggles[0],
                  headerBuilder: (context, isOpen){
                    return Text(
                      "Recently Appointed",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    );
                  },
                  body: Text(
                    'sdf',
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  )
                ),
                ExpansionPanel(
                    backgroundColor: AppStyle.darkGrey,
                    isExpanded: ExpPanelToggles[1],
                    headerBuilder: (context, isOpen){
                      return Text(
                        "Today",
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                      );
                    },
                    body: Text(
                      'sdf',
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    )
                ),
                ExpansionPanel(
                    backgroundColor: AppStyle.darkGrey,
                    isExpanded: ExpPanelToggles[2],
                    headerBuilder: (context, isOpen){
                      return Text(
                        "Recently Appointed",
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                      );
                    },
                    body: Text(
                      'sdf',
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    )
                ),
                ExpansionPanel(
                    backgroundColor: AppStyle.darkGrey,
                    isExpanded: ExpPanelToggles[3],
                    headerBuilder: (context, isOpen){
                      return Text(
                        "Recently Appointed",
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                      );
                    },
                    body: Text(
                      'sdf',
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    )
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
