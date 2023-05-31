import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late User? user;

  User? getUser() {
    user = FirebaseAuth.instance.currentUser;
    return user;
  }

  String? getUserID() {
    user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  Future<String> createUser(
      String email, String password, String username, String phone) async {
    _isLoading = true;

    notifyListeners();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isLoading = false;
      notifyListeners();
      _addcomplemntsInfo(username, phone);
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _isLoading = false;
        notifyListeners();
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _isLoading = false;
        notifyListeners();
        return 'Email Already In Use';
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.toString();
    }
    _isLoading = false;
    notifyListeners();

    return "fail";
  }

  _addcomplemntsInfo(String username, String phone) async {
    await user?.updateDisplayName(username);
  }

  Future<String> loginuser(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _isLoading = false;
      notifyListeners();
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _isLoading = false;
        notifyListeners();
        return "No user found for that email.'";
      } else if (e.code == 'wrong-password') {
        _isLoading = false;
        notifyListeners();
        return 'Wrong password provided for that user.';
      }
      return "fail";
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> changeUserName(username) async {
    try {
      _isLoading = true;

      notifyListeners();
      await user?.updateDisplayName(username);
      _isLoading = false;
      getUser();
      notifyListeners();
      return "Success";
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.toString();
    }
  }
}
