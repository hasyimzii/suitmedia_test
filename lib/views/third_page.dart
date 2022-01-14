import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/models/user.dart';
import '../providers/username_provider.dart';

import '../config/style.dart';

import '../widgets/app_layout.dart';
import '../widgets/image_avatar.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Third Screen',
      body: Consumer<UsernameProvider>(
        builder: (
          BuildContext context,
          UsernameProvider username,
          Widget? child,
        ) {
          return ListView.separated(
            itemCount: username.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 1);
            },
            itemBuilder: (BuildContext context, int index) {
              String _fullName =
                  '${username.list[index].firstName} ${username.list[index].lastName}';
              return _listContent(
                state: username.state,
                avatar: username.list[index].avatar,
                fullName: _fullName,
                email: username.list[index].email,
                onTap: () {
                  username.setUsername(_fullName);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _listContent({
    required String state,
    required String avatar,
    required String fullName,
    required String email,
    required VoidCallback onTap,
  }) {
    if (state == 'loading') {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state == 'has data') {
      return InkWell(
        child: ListTile(
          leading: ImageAvatar(
            url: avatar,
          ),
          title: Text(
            fullName,
            style: titleListText,
          ),
          subtitle: Text(
            email,
            style: subtitleListText,
          ),
        ),
        onTap: onTap,
      );
    } else if (state == 'empty') {
      return Center(
        child: Text(
          'Data is empty!',
          style: regularText(13),
        ),
      );
    } else if (state == 'error') {
      return Center(
        child: Text(
          'Connection error!',
          style: regularText(13),
        ),
      );
    } else {
      return const Text('');
    }
  }
}
