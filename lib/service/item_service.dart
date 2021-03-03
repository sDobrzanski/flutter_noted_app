import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utopia_recruitment_task/model/item/item.dart';
import 'package:utopia_recruitment_task/service/auth_service.dart';

class ItemService {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Item>> createItemStream() {
    var collection =
        _firestore.collection('users/' + AuthService().user!.uid + '/items');
    return collection
        .orderBy('created', descending: true)
        .snapshots()
        .map((event) {
      var items = <Item>[];
      for (int i = 0; i < event.docs.length; i++) {
        var doc = event.docs[i];
        items.add(
          Item(
            DateTime.fromMillisecondsSinceEpoch(doc.data()['created'],
                isUtc: true),
            doc.data()['name'],
            doc.data()['note'],
            doc.data()['url'],
          ),
        );
      }
      return items;
    });
  }

  Future saveItem(Item item) async {
    var collection =
        _firestore.collection('users/' + AuthService().user!.uid + '/items');
    item.created = DateTime.now();
    await collection.add({
      'created': item.created.toUtc().millisecondsSinceEpoch,
      'name': item.name,
      'note': item.note,
      'url': item.url,
    });
  }
}
