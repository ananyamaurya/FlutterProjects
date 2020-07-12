import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstchatapp/components/padded_rounded_material_button.dart';
import 'package:myfirstchatapp/screens/chat_screen.dart';
import 'package:myfirstchatapp/screens/login_screen.dart';
import 'package:myfirstchatapp/screens/registration_screen.dart';
import 'package:myfirstchatapp/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String welId = 'welcome'; 
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _animation;
   final _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  void checkUser() async{
    _user = await _auth.currentUser();
    if(( _user !=null)){
      kloggedinUser = _user.email;
      Navigator.pushNamed(context, ChatScreen.chatId);
    }
  }
  @override
  void initState() {
    super.initState();
    checkUser();
    _controller = AnimationController(
      duration: Duration(seconds : 1),
      vsync: this);
      _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(_controller);
      _controller.forward();

      _controller.addListener(() {
        setState(() {
          
        });
        print(_animation.value);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            PaddedRoundMaterialButton(color: Colors.lightBlueAccent, text: 'Login', onPressed: (){
                Navigator.pushNamed(context, LoginScreen.logId);
            }),
            PaddedRoundMaterialButton(color: Colors.blue, text: 'Register', onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.regId);
            }),
          ],
        ),
      ),
    );
  }
}
