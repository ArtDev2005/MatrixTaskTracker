import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matrix/project_detailed_screen.dart';
import 'package:matrix/resources/resources.dart';

import '../theme/theme.dart';
import 'clickable_widget.dart';

class CustomTab extends StatefulWidget {
  final leading;
  final content;
  final trailing;
  final destination;
  const CustomTab(
      {
        super.key,
        this.leading = null,
        this.content = null,
        this.trailing = null,
        this.destination = null,
      }
      );

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Clickable(
      action: (){
        if (widget.destination != null){
          Navigator.of(context).push(
            PageRouteBuilder(

              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,){
                return widget.destination;
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
        }

      },
      child: Container(
        color: AppStyle.mainForegroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (widget.leading != null)
                    widget.leading,
                  SizedBox(width: 16,),
                  if (widget.content != null)
                    widget.content,
                ],
              ),
              if (widget.trailing != null)
                widget.trailing,
            ],
          ),
        ),
      ),
    );
  }
}


class ProjectTab extends StatelessWidget {
  final projectColor;
  final projectName;
  const ProjectTab({super.key, required this.projectColor, required this.projectName});

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      leading: CircleAvatar(backgroundColor: projectColor,),
      content: Text(
        projectName,
        style: Theme.of(context).primaryTextTheme.bodyLarge,
      ),
      trailing: Icon(Icons.arrow_right, color: Colors.white,),
      destination: ProjectDetailedScreen(projectColor: projectColor, projectName: projectName,),
    );
  }
}

class TaskTab extends StatelessWidget {
  final date;
  final name;
  final showDate;
  const TaskTab({super.key, required this.name, required this.date, this.showDate = false});

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      leading: SvgPicture.asset(Images.tickCircleLinear),
      content: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
          if (showDate)
            Text(
              date,
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
        ],
      ),
      trailing: Icon(Icons.arrow_right, color: Colors.white,),
    );
  }
}

class SettingsTab extends StatelessWidget {
  final icon;
  final title;
  final text;
  final arrowHaving;
  const SettingsTab({super.key, required this.text, required this.icon, this.title = null, this.arrowHaving = false});

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      leading: icon,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.title != null)
            Text(
              title,
              style: Theme.of(context).primaryTextTheme.bodyMedium,
            ),
          Text(
            text,
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
        ],
      ),
      trailing: arrowHaving ? Icon(Icons.arrow_right, color: Colors.white,) : null,
    );
  }
}

