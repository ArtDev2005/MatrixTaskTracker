import 'package:flutter/material.dart';

class Clickable extends StatefulWidget {
  final Widget child;
  final Function? action;
  const Clickable(
      {
        super.key,
        required this.child,
        this.action = null
      }
      );

  @override
  State<Clickable> createState() => _ClickableState();
}

class _ClickableState extends State<Clickable> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                widget.action!.call();
              },
            ),
          ),
        )
      ],
    );
  }
}