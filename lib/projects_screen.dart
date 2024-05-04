import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matrix/custom_widgets/tabs.dart';
import 'package:matrix/resources/resources.dart';

import 'custom_widgets/rounded_widget.dart';

class ProjectsScreen extends StatefulWidget {
  ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final List<String> _projectsNames = ["WEB", "VAL WEB", "BTC", "NAN", "MTX", "SEO"];
  final List<Color> _projectsColors = [
    Colors.pink,
    Colors.blue,
    Colors.white,
    Colors.blueGrey,
    Colors.purple,
    Colors.blueAccent
  ];
  List<Widget> children = [];

  void getChild() {
    children = [];
    for (int i = 0; i < _projectsNames.length; i++){
      children.add(
          ProjectTab(
            projectName: _projectsNames[i],
            projectColor: _projectsColors[i],
          )
      );
      if (i < _projectsNames.length - 1){
        children.add(Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getChild();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(Images.picture),
                SizedBox(width: 16,),
                Text(
                  "MATRIX",
                  style: Theme.of(context).primaryTextTheme.titleLarge,
                ),
              ],
            ),
            Text(
                "Projects",
                style: Theme.of(context).primaryTextTheme.titleLarge
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 23, left: 16, right: 16),
        child: Stack(
          children: [
            RoundedWidget(
              radius: 20,
              children: children,
            ),
            Positioned(
              bottom: 10, right: 0,
              child: ElevatedButton(
                onPressed: (){

                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8,),
                    Text("New Project")
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}