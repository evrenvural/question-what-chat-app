
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  
  FirebaseUser currentUser;
  
  static final UserProvider _userProvider = UserProvider._internal();
  
  factory UserProvider() {
    return _userProvider;
  }
  
  UserProvider._internal();
  
}