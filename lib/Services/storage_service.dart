import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService();
  final db = FirebaseStorage.instance;

  Future<String> getArt(String uid, String upc) async {
  final storageRef = db.ref();
  final art = storageRef.child('$uid/catalog/$upc/artwork.jpeg');
  return await art.getDownloadURL();
}
}

StorageService st = StorageService();
