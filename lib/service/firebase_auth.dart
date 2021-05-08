import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User get currentUser;
  Future<User> signInEmail(String email, String passwd);
  Future<User> createSignInEmail(String email, String passwd);
  Future<void> signOut();
  Future<User> signInAnonymous();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User> signInEmail(String email, String passwd) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: passwd);
    return userCredential.user;
  }

  @override
  Future<User> signInAnonymous() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<User> createSignInEmail(String email, String passwd) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: passwd,
    );
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

Future<bool> logIN(String email, String passwd) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: passwd);
    if (userCredential != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return false;
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return false;
    }
    return false;
  } catch (e) {
    print("Error is $e");
    return false;
  }
  return false;
}

Future<bool> register(String email, String passwd) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: passwd);
    if (userCredential != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return false;
  } catch (e) {
    print("Error is $e");
    return false;
  }
  return false;
}
