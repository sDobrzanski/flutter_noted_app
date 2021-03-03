import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/service/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utopia_recruitment_task/constants/constants.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic item;
  DetailsScreen({required this.item});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.popAndPushNamed(context, '/notes');
          },
        ),
        title: Text(
          'Check out your note $userEmail!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            height: 300,
            width: 380,
            child: Material(
              elevation: 5,
              borderRadius: kNoteBorderRad,
              color: Colors.lightBlueAccent[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.item.name,
                      style: kNoteNameStyle,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: kDivider,
                  ),
                  Text(widget.item.note != null ? widget.item.note : '',
                      style: kNoteTextStyle),
                  SizedBox(
                    width: 350,
                    child: kDivider,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextButton(
                      onPressed: () async {
                        if (widget.item.url != null) {
                          await launch(widget.item.url);
                        } else {
                          //do nothing
                        }
                      },
                      child: Text(
                        widget.item.url != null ? widget.item.url : '',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
