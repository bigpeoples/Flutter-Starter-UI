import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';

class SuggestionService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late CollectionReference ref;

  SuggestionService() {
    ref = fireStore.collection("suggestion");
  }

  Stream<List<SuggestionModel>> suggestionList() {
    return ref.orderBy('timestamp', descending: true).snapshots().map((x) => x.docs.map((y) => SuggestionModel.fromJson(y.data() as Map<String, dynamic>)).toList());
  }

  Future<SuggestionModel> getSuggestionByEmail(String email) async {
    var res = await ref.where('email', isEqualTo: email).limit(1).get();

    if (res.docs.isNotEmpty) {
      return SuggestionModel.fromJson(res.docs.first.data() as Map<String, dynamic>);
    } else {
      throw 'No data found';
    }
  }

  Future<String> isUserSuggestionExists(String email) async {
    var res = await ref.where('email', isEqualTo: email).limit(1).get();
    if (res.docs.length == 0) {
      return '';
    } else {
      return res.docs[0].id;
    }
  }

  Future<DocumentReference> addDocument(Map data) async {
    var doc = await ref.add(data);
    doc.update({'id': doc.id});
    return doc;
  }

  Future<void> updateDocument(Map<String, dynamic> data, String id) => ref.doc(id).update(data);

  Future<void> removeDocument(String id) => ref.doc(id).delete();
}
