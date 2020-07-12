import 'package:flutter/material.dart';
import 'package:myfirstchatapp/constants.dart';
import 'package:myfirstchatapp/components/padded_rounded_material_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfirstchatapp/screens/chat_screen.dart';
import 'package:myfirstchatapp/screens/welcome_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String logId = 'login'; 
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email,password;
  bool some = false;
  FirebaseUser _user;
  bool loginProgress = false;
  Future<bool> checkUser() async{
    _user = await _auth.currentUser();
    if(( _user !=null)){
      some = true;
    }else{
      kloggedinUser = _user.email;
      some = false;
    }
  }
  void gotoWelcome() async{
    if(some){
      Navigator.pushNamed(context, WelcomeScreen.welId);
    }
  }
  @override
  void initState(){
    super.initState();
    checkUser().then((value) => gotoWelcome());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
              inAsyncCall: loginProgress,
              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                  child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration: kInputTextDecoration.copyWith(hintText:'Enter Your e-mail', )
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                maxLines: 1,
                maxLength: 25,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kInputTextDecoration.copyWith(hintText:'Enter your Password')
              ),
              SizedBox(
                height: 24.0,
              ),
              PaddedRoundMaterialButton(color: Colors.lightBlueAccent, text: 'Login', onPressed: () async{
                setState(() {
                  loginProgress =true;
                });
                  if(EmailValidator.validate(email) && password.length> 8 ){
                    try {
                      final newUser = await  _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(newUser!=null){
                        Navigator.popAndPushNamed(context, ChatScreen.chatId);
                      }
                      setState(() {
                        loginProgress =false;
                      });
                    } on Exception catch (e) {
                          print(e);
                    }
                  }
              }),
              SizedBox(
                height: 24.0,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
