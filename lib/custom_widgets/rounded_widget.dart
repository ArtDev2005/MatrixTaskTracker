import 'package:flutter/material.dart';

class RoundedWidget extends StatelessWidget {
  final double radius;
  final bool horizontal;
  final List<Widget> children;
  const RoundedWidget(
      { super.key,
        required this.radius,
        required this.children,
        this.horizontal = false,
      }
    );

  @override
  Widget build(BuildContext context) {
    List<Widget> children = this.children;
    children[0] = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              topLeft: Radius.circular(radius)
          )
      ),
      child: children[0],
    );
    children[children.length - 1] = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius)
          )
      ),
      child: children[children.length - 1],
    );
    return horizontal ? Row(
      children: children
    ) : Column(
      children: children,
    );
  }
}
