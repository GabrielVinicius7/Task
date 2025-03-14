import 'package:task/views/auth/login.dart';
import 'package:task/views/auth/register.dart';
import 'package:task/views/dashboard/config.dart';
import 'package:task/views/dashboard/home.dart';
import 'package:task/views/dashboard/notespage.dart';
import 'package:task/views/dashboard/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        //
        //restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => const Login(),
        "/register": (context) => const Register(),
        "/home": (context) => const Home(),
        "/notespage": (context) => const NotesPage(),
        "/users": (context) =>  Users(),
        "/config": (context) => const Config(),
      },
    );
  }
}
