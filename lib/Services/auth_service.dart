import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  AuthenticationService();

  final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  Future<void> signIn(String username, String password) async {
  try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: username,
    password: password
  );
} on FirebaseAuthException {
  rethrow;
}

  }
  
  Future<void> signOut() async{
    _fireAuth.signOut();
  }

  void resetPassword(String email) {
     _fireAuth.sendPasswordResetEmail(email: email);
  }

  User? getUser() {
    return _fireAuth.currentUser;
  }

  Future<bool> authStatus() async {
    User? user =  _fireAuth.currentUser;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}

AuthenticationService auth = AuthenticationService();