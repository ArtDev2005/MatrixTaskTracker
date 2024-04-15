import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrix/painters.dart';
import 'package:matrix/project_detailed_screen.dart';
import 'package:matrix/resources/resources.dart';
import 'package:matrix/theme/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<String> _projectsNames = ["WEB", "VAL WEB", "BTC", "NAN", "MTX", "SEO"];
  List<Color> _projectsColors = [
    Colors.pink,
    Colors.blue,
    Colors.white,
    Colors.blueGrey,
    Colors.purple,
    Colors.blueAccent
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Images.home,),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Images.tickCircleLinear),
              label: "Tasks"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Images.notification),
              label: "Notifications"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Images.search),
              label: "Search"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Images.account),
              label: "Account"
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 23, left: 16, right: 16),
        child: Stack(
          children: [
            ListView.separated(
              itemCount: _projectsNames.length,
              itemBuilder: (BuildContext context, int index){
                return ProjectTab(
                  id: index,
                  projectName: _projectsNames[index],
                  projectColor: _projectsColors[index],
                  projects_amount: _projectsNames.length,
                );
              },
              separatorBuilder: (BuildContext context, int index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
            ),
            Positioned(
              bottom: 10, right: 0,
              child: ElevatedButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8,),
                    Text("New Project")
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ProjectTab extends StatefulWidget{
  final int id;
  final String projectName;
  final Color projectColor;
  final int projects_amount;
  const ProjectTab(
      {
        super.key,
        required this.id,
        required this.projectName,
        required this.projectColor,
        required this.projects_amount,
      }
  );

  @override
  State<ProjectTab> createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {

  BorderRadius getBorderRadius(){
    BorderRadius br = BorderRadius.only(
      topRight: Radius.circular(0),
      topLeft: Radius.circular(0),
    );
    if (widget.id == 0){
      br = BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      );
    }
    else if (widget.id == widget.projects_amount - 1){
      br = BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      );
    }
    return br;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppStyle.mainForegroundColor,
            borderRadius: getBorderRadius(),
          ),
          height: 56,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
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
                    SizedBox(width: 10,),
                    Text(widget.projectName, style: TextStyle(color: Colors.white),),
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
              borderRadius: getBorderRadius(),
              onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder(

                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,){
                      return ProjectDetailedScreen(
                        projectName: widget.projectName,
                        projectColor: widget.projectColor,
                      );
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
            ),
          ),
        )
      ],
    );
  }
}


