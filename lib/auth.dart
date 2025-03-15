import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  late final FirebaseAuth _firebase = FirebaseAuth.instance;

  User? get currentUser => _firebase.currentUser;

  Stream<User?> get authStateChanges => _firebase.authStateChanges();

  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebase.signInWithEmailAndPassword(email: email, password: password);
      return "Login successful";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebase.createUserWithEmailAndPassword(email: email, password: password);
      return "Account created successfully";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    }
  }

  Future<String> signOut() async {
    try {
      await _firebase.signOut();
      return "Sign out successful";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    }
  }
}
