import 'package:flutter/cupertino.dart';

import '../models/user.dart';
import '../network/user_api.dart';

class UsernameProvider with ChangeNotifier {
  final List<Datum> _userList = [];
  String _username = 'Selected User Name';

  // get api
  Future<void> getUser() async {
    User? user = await UserApi.getUser();
    if(user == null) {
      return;
    } else {
      _userList.addAll(user.data);
      notifyListeners();
    }
  }

  // get api result
  List<Datum> get list => _userList;
  int get length => _userList.length;

  // get username
  String get username => _username;
  
  void setUsername(String username) {
    // set new name
    _username = username;
    notifyListeners();
  }
}