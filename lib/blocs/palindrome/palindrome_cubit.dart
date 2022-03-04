import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'palindrome_state.dart';

class PalindromeCubit extends Cubit<PalindromeState> {
  PalindromeCubit() : super(PalindromeInitial());

  void checkPalindrome(String value) {
    // remove space
    String text = value.replaceAll(" ", "");

    // slicing
    String start = text[0];
    String end = text.substring(text.length - 1);
    String cut = text.substring(1, text.length - 1);

    // check palindrome
    if (start == end) {
      if (text.length > 2) {
        if (text.length == 3) {
          // is palindrome
          emit(const PalindromeResult(message: 'is palindrome'));
        } else {
          // recursive
          return checkPalindrome(cut);
        }
      } else {
        // is palindrome
        emit(const PalindromeResult(message: 'is palindrome'));
      }
    } else {
      // not palindrome
      emit(const PalindromeResult(message: 'not palindrome'));
    }
  }
}
