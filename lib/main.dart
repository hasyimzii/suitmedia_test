import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/name_provider.dart';
import 'providers/palindrome_provider.dart';

import 'views/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => NameProvider(),
        ),
      ],
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          initialRoute: '/first_page',
          routes: {
            '/first_page': (context) => const FirstPage(),
          },
        );
      }
    );
  }
}
