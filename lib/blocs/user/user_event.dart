part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  final bool isRefresh;

  const GetUser({
    this.isRefresh = false,
  });

  @override
  List<Object> get props => [isRefresh];
}

class SetUser extends UserEvent {
  final String username;

  const SetUser({
    required this.username,
  });

  @override
  List<Object> get props => [username];
}
