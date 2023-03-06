import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/add_new_note_screen.dart';
import 'package:notes/screens/login_screen.dart';
import 'package:notes/screens/notes_screen.dart';
import 'package:notes/screens/splash_screen.dart';
import './models/note_model.dart';
import './models/user_model.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NotesApp());
}
late double height;
late double width;
class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),);
  }
}