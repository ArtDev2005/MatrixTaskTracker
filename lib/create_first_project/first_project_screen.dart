import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matrix/theme/theme.dart';

import 'new_project_name_widget.dart';

double multiplier = 1;

class FirstProjectScreen extends StatefulWidget {
  FirstProjectScreen({super.key});

  @override
  State<FirstProjectScreen> createState() => _FirstProjectScreenState();
}

class _FirstProjectScreenState extends State<FirstProjectScreen> {

  final textFieldDecorator = InputDecoration(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.white),
    labelText: "Project name",
    contentPadding: EdgeInsets.only(left: 16),
  );

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {

    });
  }
  InputDecoration decorate(String labelName, Icon icon){
    return InputDecoration(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelName,
      contentPadding: EdgeInsets.only(left: 16),
      prefixIcon: icon,
    );
  }

  List<bool> textFieldsStates = List.filled(4, false);

  void callback(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewProjectNameWidget()
    );
  }
}











