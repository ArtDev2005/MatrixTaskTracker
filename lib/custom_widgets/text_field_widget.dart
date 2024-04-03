import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final bool enabled;
  final String iconPath;
  final String labelText;
  final Color color;
  CustomTextField(
      {
        super.key,
        required this.enabled,
        required this.iconPath,
        required this.labelText,
        required this.color,
      }
  );


  InputDecoration decorateTextFields(){
    return InputDecoration(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: this.color),
        ),
      disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: this.color),
        ),
      labelStyle: TextStyle(color: this.color),
        labelText: this.labelText,
        contentPadding: EdgeInsets.only(left: 16),
      prefixIcon: SvgPicture.asset(
        this.iconPath,
        fit: BoxFit.scaleDown,
        colorFilter: this.color == Colors.white24 ? ColorFilter.mode(this.color, BlendMode.srcIn) : null,
      ),
    );
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  // TODO: implement widget
  CustomTextField get widget => super.widget;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    // if (_focusNode.hasFocus){
    // }
    print("Focus: ${_focusNode.hasFocus.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      decoration: widget.decorateTextFields(),
    );
  }
}
