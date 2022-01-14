import 'package:flutter/material.dart';
import 'package:suitmedia_test/config/style.dart';

import '../widgets/app_layout.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Third Screen',
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1);
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: ClipOval(
              child: Image.network(
                'https://reqres.in/img/faces/7-image.jpg',
                width: 49,
                height: 49,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              'Firstname Lastname',
              style: titleListText,
            ),
            subtitle: Text(
              'email@email.com',
              style: subtitleListText,
            ),
          );
        },
      ),
    );
  }
}
