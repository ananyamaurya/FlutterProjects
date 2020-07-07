import 'package:flutter/material.dart';
import 'package:mark_it/constants/constants.dart';

class TaskTile extends StatefulWidget {
  String task;
  bool status;
  TaskTile ({this.task,this.status});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  TextDecoration deco = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.status,
       title: Text(widget.task, style: TextStyle(decoration: widget.status ?TextDecoration.lineThrough : TextDecoration.none,),),
       onChanged:(bool value) {
          setState(() {
            widget.status = value;
            kUpdateList(widget.task);
          });
       } 
      );
  }
}