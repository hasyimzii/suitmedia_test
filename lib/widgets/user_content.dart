import 'package:flutter/material.dart';
import '../config/style.dart';

class UserContent extends StatelessWidget {
  final String image;
  final String fullName;
  final String email;
  final VoidCallback onTap;

  const UserContent({
    Key? key,
    required this.image,
    required this.fullName,
    required this.email,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: ClipOval(
          child: Image.network(
            image,
            width: 49,
            height: 49,
            fit: BoxFit.cover,
          ),
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
