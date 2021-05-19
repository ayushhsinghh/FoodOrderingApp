import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User get currentUser;
  Future<User> signInEmail(String email, String passwd);
  Future<User> createSignInEmail(
      String email, String passwd, String displayName);
  Future<void> signOut();
  Future<User> signInAnonymous();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User> signInEmail(String email, String passwd) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: passwd);
      return userCredential.user;
    } catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
      print(e.toString());
      return null;
    }
  }

  @override
  Future<User> signInAnonymous() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<User> createSignInEmail(
      String email, String passwd, String displayName) async {
    final userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: passwd,
    )
        .then((value) {
      value.user.updateProfile(displayName: displayName);
    });
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
