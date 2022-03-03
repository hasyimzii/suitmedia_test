import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/name_provider.dart';

import '../common/style.dart';

import '../widgets/app_layout.dart';
import '../widgets/submit_button.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Second Screen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: regularText(12),
              ),
              Consumer<NameProvider>(
                builder: (
                  BuildContext context,
                  NameProvider name,
                  Widget? child,
                ) {
                  return Text(
                    name.name,
                    style: titleText(18),
                  );
                },
              ),
            ],
          ),
          // Center(
          //   child: Consumer<UsernameProvider>(
          //     builder: (
          //       BuildContext context,
          //       UsernameProvider username,
          //       Widget? child,
          //     ) {
          //       return Text(
          //         username.username,
          //         style: titleText(24),
          //       );
          //     },
          //   ),
          // ),
          SubmitButton(
            label: 'Choose a User',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/third_page',
              );
            },
          ),
        ],
      ),
    );
  }
}
