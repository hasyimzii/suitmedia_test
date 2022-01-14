import 'package:flutter/cupertino.dart';

class PalindromeProvider with ChangeNotifier {
  bool _result = false;

  bool get result => _result;

  void palindrome(String text) {
    // slicing
    String start = text[0];
    String end = text.substring(text.length - 1);
    String cut = text.substring(1, text.length - 1);

    // check palindrome
    if (start == end) {
      if (text.length > 2) {
        // recursive
        return palindrome(cut); 
      } else {
        // is palindrome
        _result = true;
        notifyListeners();
      }
    } else {
        // not palindrome
      _result = false;
      notifyListeners();
    }
  }
}
