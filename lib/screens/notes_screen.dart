import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/screens/add_note_screen.dart';
import 'package:utopia_recruitment_task/service/auth_service.dart';
import 'package:utopia_recruitment_task/widgets/notes_stream.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animations/animations.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  AuthService auth = AuthService();
  String? userEmail;

  @override
  void initState() {
    super.initState();
    userEmail = auth.user!.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.logout),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            await auth.signOut();
            Navigator.popAndPushNamed(context, '/');
          },
        ),
        title: Text(
          'Check your notes $userEmail!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: NotesStream()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OpenContainer(
                transitionDuration: Duration(milliseconds: 700),
                closedElevation: 0,
                openElevation: 0,
                openBuilder: (context, _) => AddNoteScreen(),
                closedBuilder: (context, VoidCallback openContainer) =>
                    FloatingActionButton(
                  onPressed: openContainer,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue,
                  elevation: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
