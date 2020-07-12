import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstchatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfirstchatapp/message_class.dart';

class ChatScreen extends StatefulWidget {
  static const String chatId = 'chat'; 
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  var _controller = TextEditingController();
  final _firestoreData = Firestore.instance;
  FirebaseUser loggedInUser;
  String messageText;
  void getMessage() async{
    final messages = await _firestoreData.collection('messages').where('sender',isEqualTo:loggedInUser.email).getDocuments();
    for (var message in messages.documents){
      print(message.data);
    }
  }
  @override
  void initState() {
  
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser()async {
    try {
      final user  = await _auth.currentUser();
      if(user!= null){
        loggedInUser =user;
        print(loggedInUser.email);
      }else{
        Navigator.pop(context);
      }
    } on Exception catch (e) {
          print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                 getMessage();
              //  _auth.signOut();
              //  Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
          children: <Widget>[
            Expanded(child: MessageClass()),
            
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText =value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      
                      String createdAt = DateFormat.jm().format(new DateTime.now()).toString() + DateFormat.yMMMd().format(new DateTime.now()).toString();
                      _firestoreData.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                          'created_at': createdAt ,
                      });
                     
                      _controller.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
