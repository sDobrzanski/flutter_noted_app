import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/service/auth_service.dart';
import 'package:utopia_recruitment_task/widgets/custom_main_button.dart';
import 'package:utopia_recruitment_task/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utopia_recruitment_task/widgets/custom_alert_box.dart';
import 'package:utopia_recruitment_task/widgets/animated_name.dart';

class LoginScreen extends StatelessWidget {
  String? email;
  String? password;
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: CustomAnimatedLogo(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: CustomTextField(
                    onChanged: (value) {
                      email = value;
                    },
                    isPassword: false,
                    hintText: 'Enter e-mail',
                    icon: Icons.email),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: CustomTextField(
                    onChanged: (value) {
                      password = value;
                    },
                    isPassword: true,
                    hintText: 'Enter password',
                    icon: Icons.lock),
              ),
              CustomMainButton(
                  text: 'Sign Up',
                  onPressed: () async {
                    if (email == null || password == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomAlertBox(
                          message: "Please provide proper login data.",
                        ),
                      );
                    } else {
                      await auth.logInOrRegister(email!, password!);
                      FocusScope.of(context).requestFocus(FocusNode());
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('email', email);
                      Navigator.popAndPushNamed(context, '/notes');
                    }
                  },
                  color: Colors.lightBlueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
