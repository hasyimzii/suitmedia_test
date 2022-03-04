part of 'palindrome_cubit.dart';

abstract class PalindromeState extends Equatable {
  const PalindromeState();

  @override
  List<Object> get props => [];
}

class PalindromeInitial extends PalindromeState {}

class PalindromeResult extends PalindromeState {
  final String message;

  const PalindromeResult({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
