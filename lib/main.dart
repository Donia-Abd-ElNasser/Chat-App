
import 'package:chatapp3/Screens/ChatScreen.dart';
import 'package:chatapp3/Screens/loginScreen.dart';
import 'package:chatapp3/Screens/registerationScreen.dart';
import 'package:chatapp3/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ChatApp());

}
class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context)=>LoginScreen(),
        RegisterationScreen.id:(context)=>RegisterationScreen(),
        ChatScreen.id:(context)=>ChatScreen()
      },
      home: LoginScreen(),
    );
  }
}