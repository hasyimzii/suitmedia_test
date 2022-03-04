part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final int page;
  final List<UserData> user;
  final bool reachedMax;
  final String username;

  const UserLoaded({
    this.page = 1,
    this.user = const <UserData>[],
    this.reachedMax = false,
    this.username = 'Select a User',
  });

  UserLoaded copyWith({
    List<UserData>? user,
    bool? reachedMax,
    String? username,
  }) {
    return UserLoaded(
      user: user ?? this.user,
      reachedMax: reachedMax ?? this.reachedMax,
      username: username ?? this.username,
    );
  }

  @override
  List<Object> get props => [page, user, reachedMax, username];
}

class UserError extends UserState {}
