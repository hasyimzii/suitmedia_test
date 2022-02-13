import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../common/result_state.dart';
import '../common/style.dart';

import '../providers/username_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/user_content.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RefreshController _refreshController = RefreshController(initialRefresh: true);
    return AppLayout(
      title: 'Third Screen',
      body: Consumer<UsernameProvider>(
        builder: (
          BuildContext context,
          UsernameProvider username,
          Widget? child,
        ) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullUp: true,
            onRefresh: () async {
              final bool result = await username.getUser(isRefresh: true);
              if(result) {
                _refreshController.refreshCompleted();
                _refreshController.loadComplete();
              } else {
                _refreshController.refreshFailed();
                _refreshController.loadComplete();
              }
            },
            onLoading: () async {
              final bool result = await username.getUser();
              if(result) {
                _refreshController.loadComplete();
              } else {
                _refreshController.loadNoData();
              }
            },
            child: _listContent(username),
          );
        },
      ),
    );
  }

  Widget _listContent(UsernameProvider username) {
    if (username.state == ResultState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (username.state == ResultState.hasData) {
      return ListView.separated(
        itemCount: username.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1);
        },
        itemBuilder: (BuildContext context, int index) {
          String _fullName =
              '${username.list[index].firstName} ${username.list[index].lastName}';
          return UserContent(
            image: username.list[index].avatar,
            fullName: _fullName,
            email: username.list[index].email,
            onTap: () {
              username.setUsername(_fullName);
            },
          );
        },
      );
    } else if (username.state == ResultState.noData) {
      return Center(
        child: Text(
          'Data is empty!',
          style: regularText(13),
        ),
      );
    } else if (username.state == ResultState.error) {
      return Center(
        child: Text(
          'Connection error!',
          style: regularText(13),
        ),
      );
    } else {
      return Center(
        child: Text(
          'Something went wrong!',
          style: regularText(13),
        ),
      );
    }
  }
}
