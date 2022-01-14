import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              String _fullName = '${username.list[index].firstName} ${username.list[index].lastName}';
              return _listContent(
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
    required String avatar,
    required String fullName,
    required String email,
    required VoidCallback onTap,
  }) {
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
  }
}
