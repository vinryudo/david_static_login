import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Register with email and password
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Error during registration: ${e.code}');
      return null;
    } catch (e) {
      print('An unexpected error occurred: ${e.toString()}');
      return null;
    }
  }

  // Sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Error during sign-in: ${e.code}');
      return null;
    } catch (e) {
      print('An unexpected error occurred: ${e.toString()}');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}