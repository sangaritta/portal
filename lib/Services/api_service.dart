import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portal/Services/auth_service.dart';


class ApiService {
  ApiService();
  final db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getCatalog() async {
  DocumentSnapshot<Map<String, dynamic>> doc = await db.collection("catalog").doc(auth.getUser()!.uid).get();
  return doc;
}
}

ApiService api = ApiService();
