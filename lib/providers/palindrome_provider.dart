import 'package:flutter/cupertino.dart';

class PalindromeProvider with ChangeNotifier {
  String _result = '';

  String get result => _result;

  void check(String text) {
    // slicing
    String start = text[0];
    String end = text.substring(text.length - 1);
    String cut = text.substring(1, text.length - 1);

    // check palindrome
    if (start == end) {
      if (text.length > 2) {
        // recursive
        return check(cut); 
      } else {
        // is palindrome
        _result = 'is palindrome';
        notifyListeners();
      }
    } else {
        // not palindrome
      _result = 'not palindrome';
      notifyListeners();
    }
  }
}
