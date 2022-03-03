import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/user.dart';
import '../../network/user_api.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    User user;

    on<GetUser>((event, emit) async {
      try {
        if (state is UserInitial) {
          user = await UserApi.getUser(
            page: 1,
            perPage: 8,
          );

          emit(UserLoaded(
            user: user.data,
            reachedMax: false,
          ));
        } else {
          UserLoaded userLoaded = state as UserLoaded;
          if (userLoaded.reachedMax) return;
          
          user = await UserApi.getUser(
            page: userLoaded.page + 1,
            perPage: 8,
          );

          if (user.data.isEmpty) {
            emit(userLoaded.copyWith(
              reachedMax: true,
            ));
          } else {
            emit(UserLoaded(
              page: userLoaded.page + 1,
              user: List.of(userLoaded.user)..addAll(user.data),
              reachedMax: false,
            ));
          }
        }
      } catch (e) {
        emit(UserError());
      }
    });
  }
}
