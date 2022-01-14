import 'package:flutter/cupertino.dart';

import '../models/user.dart';
import '../network/user_api.dart';

class UsernameProvider with ChangeNotifier {
  final List<Datum> _userList = [];
  String _state = '';
  String _username = 'Selected User Name';

  UsernameProvider() {
    _getUser();
  }

  // get api
  Future<void> _getUser() async {
    try {
      _state = 'loading';
      notifyListeners();

      User? user = await UserApi.getUser();
      if(user == null) {
        _state = 'empty';
        notifyListeners();
      } else {
        _state = 'has data';
        _userList.addAll(user.data);
        notifyListeners();
      }
    } catch (e) {
      _state = 'error';
      notifyListeners();
    }
  }

  // get api result
  List<Datum> get list => _userList;
  String get state => _state;
  int get length => _userList.length;

  // get username
  String get username => _username;
  
  void setUsername(String username) {
    // set new name
    _username = username;
    notifyListeners();
  }
}