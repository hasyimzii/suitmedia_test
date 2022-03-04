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

  const UserLoaded({
    this.page = 1,
    this.user = const <UserData>[],
    this.reachedMax = false,
  });

  UserLoaded copyWith({List<UserData>? user, bool? reachedMax}) {
    return UserLoaded(
      user: user ?? this.user,
      reachedMax: reachedMax ?? this.reachedMax,
    );
  }

  @override
  List<Object> get props => [user, reachedMax];
}

class UserError extends UserState {}

class UserSelected extends UserState {
  final String username;

  const UserSelected({
    this.username = 'Select a User',
  });

  @override
  List<Object> get props => [username];
}
