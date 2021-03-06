import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/name/name_cubit.dart';
import 'blocs/palindrome/palindrome_cubit.dart';
import 'blocs/user/user_bloc.dart';

import 'views/first_page.dart';
import 'views/second_page.dart';
import 'views/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NameCubit(),
        ),
        BlocProvider(
          create: (context) => PalindromeCubit(),
        ),
        BlocProvider(
          create: (context) => UserBloc()..add(const GetUser()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        initialRoute: '/first_page',
        routes: {
          '/first_page': (context) => const FirstPage(),
          '/second_page': (context) => const SecondPage(),
          '/third_page': (context) => const ThirdPage(),
        },
      ),
    );
  }
}
