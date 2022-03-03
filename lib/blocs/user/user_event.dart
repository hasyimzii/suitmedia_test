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
