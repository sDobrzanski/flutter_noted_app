import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utopia_recruitment_task/service/auth_service.dart';
import 'package:utopia_recruitment_task/model/item/item.dart';
import 'package:utopia_recruitment_task/service/item_service.dart';
import 'package:utopia_recruitment_task/widgets/custom_main_button.dart';
import 'package:utopia_recruitment_task/widgets/custom_alert_box.dart';
import 'package:utopia_recruitment_task/constants/constants.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  AuthService auth = AuthService();
  ItemService itemService = ItemService();
  String? userEmail;
  String noteName = '';
  DateTime currentTime = DateTime.now();
  String? noteDesc;
  String? noteLink;

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
          'Add note $userEmail!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 300,
                width: 380,
                child: Material(
                  elevation: 5,
                  borderRadius: kNoteBorderRad,
                  color: Colors.lightBlueAccent[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 5),
                        child: TextField(
                          onChanged: (value) {
                            noteName = value;
                          },
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 25),
                            hintText: 'Add name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 4.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: TextField(
                          onChanged: (value) {
                            noteDesc = value;
                          },
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 25),
                            hintText: 'Add description',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: TextField(
                          onChanged: (value) {
                            noteLink = value;
                          },
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 25),
                            hintText: 'Add link',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomMainButton(
                  text: 'Add',
                  onPressed: () async {
                    if (noteName.isNotEmpty) {
                      Item item =
                          Item(currentTime, noteName, noteDesc, noteLink);
                      await itemService.saveItem(item);
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.popAndPushNamed(context, '/notes');
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomAlertBox(
                          message: "Please provide name for your note.",
                        ),
                      );
                    }
                  },
                  color: Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
