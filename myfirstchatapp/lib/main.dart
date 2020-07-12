import 'package:flutter/material.dart';
import 'package:myfirstchatapp/screens/welcome_screen.dart';
import 'package:myfirstchatapp/screens/login_screen.dart';
import 'package:myfirstchatapp/screens/registration_screen.dart';
import 'package:myfirstchatapp/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.welId,
      routes: {
        LoginScreen.logId : (contex) => LoginScreen(),
        RegistrationScreen.regId : (context) => RegistrationScreen(),
        ChatScreen.chatId : (context) => ChatScreen(),
        WelcomeScreen.welId : (context) => WelcomeScreen()
      },
    );
  }
}
