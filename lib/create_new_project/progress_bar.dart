import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ProgressBarWidget extends StatefulWidget {
  final double step;
  final Widget nextScreen;
  const ProgressBarWidget({super.key, required this.step, required this.nextScreen});

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 270,
                height: 4,
                color: AppStyle.linearProgressBarColor,
              ),
              Container(
                width: 90 * widget.step.toDouble(),
                height: 4,
                color: AppStyle.mainForegroundColor,
              ),
            ],
          ),
          SizedBox(width: 20,),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppStyle
                    .mainForegroundColor)),
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(

                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,){
                    return widget.nextScreen;
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
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}