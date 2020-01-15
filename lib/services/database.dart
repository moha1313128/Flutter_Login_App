import "package:cloud_firestore/cloud_firestore.dart";


class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference dataCollection = Firestore.instance.collection('data');

  Future updateUserData(String sugars, String name, int strength) async {
    return await dataCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}