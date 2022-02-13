import 'package:flutter/material.dart';
import '../common/style.dart';

class AppLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const AppLayout({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: whiteColor,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blueColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: titleText(18),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: body,
        ),
      ),
    );
  }
}
