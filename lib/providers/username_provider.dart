import 'package:flutter/cupertino.dart';

class UsernameProvider with ChangeNotifier {
  String _username = 'Selected User Name';

  String get username => _username;
  
  void setUsername(String username) {
    // set new name
    _username = username;
    notifyListeners();
  }
}