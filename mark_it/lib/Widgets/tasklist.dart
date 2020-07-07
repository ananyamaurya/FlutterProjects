import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mark_it/constants/constants.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      dragStartBehavior: DragStartBehavior.start,
      addAutomaticKeepAlives: true,
      padding: EdgeInsets.only(top: 40, bottom: 30, right: 30, left: 30),
      children: 
        kTaskListGenerate(),

    );
  }
  @override
  void setState(fn) {
    super.setState(fn);
  }
}
