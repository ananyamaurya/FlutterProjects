import 'package:flutter/material.dart';
import 'package:mark_it/Widgets/tasklist.dart';
import 'package:mark_it/Widgets/bottomsheetmarkit.dart';

class TaskScreens  extends StatefulWidget {
  @override
  _TaskScreensState createState() => _TaskScreensState();
}

class _TaskScreensState extends State<TaskScreens> {
  double radii;
  @override
  
  @override
  Widget build(BuildContext context) {
    radii = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(context: context, builder: (context) => AddTaskBox()).whenComplete(() => setState((){}));
          }),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Container(
                padding:
                    EdgeInsets.only(top: 60, bottom: 30, right: 30, left: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.list,
                            size: 48, color: Colors.lightBlueAccent),
                        radius: 36,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Mark It',
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                      Text(
                        '12 Tasks',
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
              ),
            ),
            Flexible(
              flex: 9,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: radii * 0.65,
                child: TaskList(),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(30),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
