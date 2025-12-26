import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get current user
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }

  //login
  Future<UserCredential> loginWithEmailAndPassword(String email, password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //signup
  Future<UserCredential> signUpWithEmailAndPassword(String email, password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //logout
  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }
}