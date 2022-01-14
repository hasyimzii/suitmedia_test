import 'package:flutter/cupertino.dart';

class NameProvider with ChangeNotifier {
  String _name = '';

  String get name => _name;
  
  void setName(String name) {
    // set new name
    _name = name;
    notifyListeners();
  }
}