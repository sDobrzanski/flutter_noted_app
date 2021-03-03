import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/screens/add_note_screen.dart';
import 'package:utopia_recruitment_task/screens/login_screen.dart';
import 'package:utopia_recruitment_task/screens/notes_screen.dart';
import 'package:utopia_recruitment_task/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/notes': (context) => NotesScreen(),
        '/addNote': (context) => AddNoteScreen(),
      },
    );
  }
}
