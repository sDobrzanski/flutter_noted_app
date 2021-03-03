import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/service/item_service.dart';
import 'package:utopia_recruitment_task/widgets/note_card.dart';
import 'package:utopia_recruitment_task/screens/details_screen.dart';

class NotesStream extends StatelessWidget {
  ItemService itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: itemService.createItemStream(),
        builder: (BuildContext context, AsyncSnapshot<List> items) {
          if (items.hasData != true) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }
          return ListView(
            children: items.data!.map((dynamic item) {
              return OpenContainer(
                transitionDuration: Duration(milliseconds: 1500),
                closedElevation: 0,
                openElevation: 0,
                openBuilder: (context, _) => DetailsScreen(
                  item: item,
                ),
                closedBuilder: (context, VoidCallback openContainer) =>
                    NoteCard(
                  noteName: item.name,
                  noteDesc: item.note,
                  noteLink: item.url,
                  onTap: openContainer,
                ),
              );
            }).toList(),
          );
        });
  }
}
