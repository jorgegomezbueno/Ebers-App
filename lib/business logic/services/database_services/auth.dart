import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user from firebase
  MyUser _userFromFirebaseUser(User user) {
    return user != null ? MyUser(userId: user.uid) : null;
  }

  //Sign in with email and password
  Future loginWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      return _userFromFirebaseUser(user);
    }catch(error){
      print(error.toString());
      return null;
    }
  }

  //Register an user with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }
}