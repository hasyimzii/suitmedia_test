import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../blocs/user/user_bloc.dart';

import '../common/style.dart';

import '../widgets/app_layout.dart';
import '../widgets/user_content.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  UserBloc _userBloc = UserBloc();

  void onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.offset;

    if (currentScroll >= maxScroll) {
      _userBloc.add(GetUser());
    }
  }

  @override
  Widget build(BuildContext context) {
    _userBloc = context.read<UserBloc>();
    _scrollController.addListener(onScroll);

    return AppLayout(
      title: 'Third Screen',
      body: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state is UserLoaded) {
            if (state.user.isNotEmpty) {
              return _listContent(state, _scrollController);
            } else {
              return Center(
                child: Text(
                  'Data not found!',
                  style: regularText(13),
                ),
              );
            }
          } else if (state is UserError) {
            return Center(
              child: Text(
                'Something went wrong!',
                style: regularText(13),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }

  Widget _listContent(
      UserLoaded userLoaded, ScrollController _scrollController) {
    List<UserData> user = userLoaded.user;

    return ListView.separated(
      controller: _scrollController,
      itemCount: (userLoaded.reachedMax) ? user.length : user.length + 1,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
      itemBuilder: (BuildContext context, int index) {
        if (index < user.length) {
          String _fullName = '${user[index].firstName} ${user[index].lastName}';
          return UserContent(
            image: user[index].avatar,
            fullName: _fullName,
            email: user[index].email,
            onTap: () {},
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
