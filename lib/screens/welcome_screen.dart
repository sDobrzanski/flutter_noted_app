import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/widgets/animated_name.dart';
import 'package:utopia_recruitment_task/widgets/custom_main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: CustomAnimatedLogo(),
              ),
              CustomMainButton(
                  text: 'Sign Up/In',
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    email = prefs.getString('email');
                    Navigator.popAndPushNamed(
                        context, email == null ? '/login' : '/notes');
                  },
                  color: Colors.lightBlue[300]),
            ],
          ),
        ),
      ),
    );
  }
}
