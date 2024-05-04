import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrix/custom_widgets/clickable_widget.dart';
import 'package:matrix/custom_widgets/rounded_widget.dart';
import 'package:matrix/custom_widgets/tabs.dart';
import 'package:matrix/custom_widgets/painters.dart';
import 'package:matrix/project_detailed_screen.dart';
import 'package:matrix/projects_screen.dart';
import 'package:matrix/resources/resources.dart';
import 'package:matrix/search_screen.dart';
import 'package:matrix/tasks_screen.dart';
import 'package:matrix/theme/theme.dart';

import 'account_screen.dart';
import 'custom_widgets/custom_expansion_tile.dart';
import 'notifications_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  void _toggle(int index) {
    setState(() {
      if (_currentIndex != index){
        _currentIndex = index;
      }
      else{
        _navigatorKeys[index]!.currentState!.popUntil((route) => route.isFirst);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          currentIndex: _currentIndex,
          onTap: _toggle,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            TabNavigator(navigatorKey: _navigatorKeys[0], child: ProjectsScreen()),
            TabNavigator(navigatorKey: _navigatorKeys[1], child: TasksScreen()),
            TabNavigator(navigatorKey: _navigatorKeys[2], child: NotificationsScreen()),
            TabNavigator(navigatorKey: _navigatorKeys[3], child: SearchScreen()),
            TabNavigator(navigatorKey: _navigatorKeys[4], child: AccountScreen()),
          ],
        )
    );
  }
}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.child});
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return PageRouteBuilder(

          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,){
            return child;
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

        );
      },
    );
  }
}
