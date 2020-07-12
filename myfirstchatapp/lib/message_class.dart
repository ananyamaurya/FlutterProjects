import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MessageClass extends StatelessWidget {
  TextAlign x;
  FirebaseUser loggedInUser;
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('messages').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                if (document['sender'].toString() == kloggedinUser) {
                  return new Bubble( 
                  nipWidth: 10.0,
                  alignment: Alignment.topRight,
                  margin: BubbleEdges.only(top: 10),
                   nip: BubbleNip.rightTop,
                  color: Colors.lightBlueAccent,
                  child:ListTile(
                  title: new Text(document['text'], textAlign: x,),
                  subtitle: new Text(document['created_at'].toString(),textAlign: x,),
                ));
                } else {
                  return new Bubble( 
                  nipWidth: 10.0,
                  alignment: Alignment.topLeft,
                  margin: BubbleEdges.only(top: 10),
                   nip: BubbleNip.leftTop,
                  color: Colors.amberAccent,
                  child:ListTile(
                  title: new Text(document['text'], textAlign: x,),
                  subtitle: new Text(document['created_at'].toString(),textAlign: x,),
                ));
                }
                
              }).toList(),
            );
        }
      },
    );
  }
}