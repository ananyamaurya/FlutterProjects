import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstchatapp/constants.dart';
import 'package:myfirstchatapp/components/padded_rounded_material_button.dart';
import 'package:myfirstchatapp/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String regId = 'register'; 
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email,password;
  bool registerProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
              inAsyncCall: registerProgress,
              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'hero',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputTextDecoration.copyWith(hintText: 'Enter your Email')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                maxLength: 25,
                maxLines: 1,
                textAlign: TextAlign.center,
                enableSuggestions: false,
                obscureText: true,
                keyboardType: TextInputType.text,

                onChanged: (value) {
                  password = value;
                },
                decoration: kInputTextDecoration.copyWith(hintText: 'Enter Your Password',)
              ),
              SizedBox(
                height: 24.0,
              ),
              PaddedRoundMaterialButton(color: Colors.blue, text: 'Register', onPressed: () async{
                setState(() {
                  registerProgress =true;
                });
                 if(EmailValidator.validate(email) && password.length> 8 ){
                    try {
                      final newUser = await  _auth.createUserWithEmailAndPassword(email: email, password: password);
                      
                      if(newUser!=null){
                        Navigator.pushNamed(context, ChatScreen.chatId);
                      }
                      setState(() {
                        registerProgress =false;
                      });
                    } on Exception catch (e) {
                          print(e);
                    }
                  }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
