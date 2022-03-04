import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/name/name_cubit.dart';
import '../blocs/user/user_bloc.dart';

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
              BlocBuilder<NameCubit, NameState>(
                builder: (context, state) {
                  return Text(
                    state.name,
                    style: titleText(18),
                  );
                },
              ),
            ],
          ),
          Center(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                UserSelected userSelected = state as UserSelected;
                return Text(
                  userSelected.username,
                  style: titleText(24),
                );
              },
            ),
          ),
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
