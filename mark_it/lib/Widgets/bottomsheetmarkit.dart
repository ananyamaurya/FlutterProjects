import 'package:flutter/material.dart';
import 'package:mark_it/constants/constants.dart';


class AddTaskBox extends StatefulWidget {
  
  @override
  _AddTaskBoxState createState() => _AddTaskBoxState();
}

class _AddTaskBoxState extends State<AddTaskBox> {
  String s;
  String hintText = 'Some Task';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
          color: Color(0xff757575),
          child: Container(
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius : BorderRadius.only(topLeft : Radius.circular(15), topRight: Radius.circular(15))
        ),
        child:Expanded(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[

                Text('Add Task', style: TextStyle(
                  fontSize: 40, color: Colors.lightBlueAccent
                ),),

                TextField(
                
                  decoration: InputDecoration(
                      hintText: hintText,
                      
                  ),
                  onChanged: (value){
                    s = value;
                },),
                RaisedButton(
                  onPressed:(){
                    if(s == null){

                    }else{
                    print(s);
                    kTaskAdd(s).whenComplete(() =>setState((){}));
                    Navigator.pop(context);
                  }},
                  child: Text('ADD TASK'),  
                  )
            ]
          ),
        ),
      ),
    );
  }
}