import 'package:flutter/cupertino.dart';

import '../common/result_state.dart';
import '../models/user.dart';
import '../network/user_api.dart';

class UsernameProvider with ChangeNotifier {
  List<Datum> _userList = [];
  int _currentPage = 1;
  int _totalPages = 1;
  // String _state = 'loading';
  ResultState? _state;
  String _username = 'Selected User Name';

  UsernameProvider() {
    getUser(isRefresh: true);
  }

  // get api
  Future<dynamic> getUser({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      notifyListeners();
    } else {
      if (_currentPage > _totalPages) {
        return false;
      }
    }

    try {
      // get api
      User? user = await UserApi.getUser(page: _currentPage);
      // if empty
      if(user == null) {
        _state = ResultState.noData;
        notifyListeners();
      // if has data
      } else {
        _state = ResultState.hasData;
        if (isRefresh) {
          _userList = user.data;
        } else {
          _userList.addAll(user.data);
        }
        _currentPage++;
        _totalPages = user.totalPages;
        notifyListeners();
      }
    // if error
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
    return true;
  }

  // get api result
  List<Datum> get list => _userList;
  ResultState? get state => _state;
  int get length => _userList.length;

  // get username
  String get username => _username;
  
  void setUsername(String username) {
    // set new name
    _username = username;
    notifyListeners();
  }
}