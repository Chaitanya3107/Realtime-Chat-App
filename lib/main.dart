import 'package:flutter/material.dart';
import 'package:realtime_chat_app/home/home.dart';
import 'package:realtime_chat_app/loginPage/chatPage/chatPage.dart';
import 'package:realtime_chat_app/loginPage/phone_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // "/": (context) => const PhoneLogin(),
        "/": (context) => HomePage(),
        "/home": (context) => HomePage(),
        "/chat": (context) => ChatPage(),
      },
    );
  }
}
