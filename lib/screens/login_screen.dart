import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/service/auth_service.dart';
import 'package:utopia_recruitment_task/widgets/custom_main_button.dart';
import 'package:utopia_recruitment_task/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utopia_recruitment_task/widgets/custom_alert_box.dart';
import 'package:utopia_recruitment_task/widgets/animated_name.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      setState(() {
                        email = value;
                      });
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
                      setState(() {
                        password = value;
                      });
                    },
                    isPassword: true,
                    hintText: 'Enter password',
                    icon: Icons.lock),
              ),
              CustomMainButton(
                  text: 'Sign Up',
                  onPressed: () async {
                    bool? isLoggedIn;
                    if (email != null && password != null) {
                      isLoggedIn =
                          await auth.logInOrRegister(email!, password!);
                      if (isLoggedIn == true) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('email', email!);
                        Navigator.popAndPushNamed(context, '/notes');
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomAlertBox(
                            message: "Please provide proper login data.",
                          ),
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomAlertBox(
                          message: "Please provide proper login data.",
                        ),
                      );
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
