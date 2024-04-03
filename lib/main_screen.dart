import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: ListView.separated(
          itemCount: _projectsNames.length,
          itemBuilder: (BuildContext context, int index){
            return ProjectTab(
              projectName: _projectsNames[index],
              projectColor: _projectsColors[index]
            );
          },
          separatorBuilder: (BuildContext context, int index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}


class ProjectTab extends StatefulWidget {
  final String projectName;
  final Color projectColor;
  const ProjectTab(
      {
        super.key,
        required this.projectName,
        required this.projectColor,
      }
  );

  @override
  State<ProjectTab> createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.only(
          //     topRight: Radius.circular(20),
          //     topLeft: Radius.circular(20),
          //   ),
          //   color: AppStyle.bottomNavigationBarColor,
          //),
          color: AppStyle.bottomNavigationBarColor,
          //width: MediaQuery.of(context).size.width,
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
              onTap: (){},
            ),
          ),
        )
      ],
    );
  }
}

class CirclePainter extends CustomPainter{
  final Color color;
  CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size){
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, Paint()..color = this.color);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TrianglePainter extends CustomPainter{
  final Color color;
  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size){
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, Paint()..color = this.color);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
