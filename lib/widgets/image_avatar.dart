import 'package:flutter/material.dart';
import '../config/style.dart';

class ImageAvatar extends StatelessWidget {
  final String url;

  const ImageAvatar({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        url,
        width: 49,
        height: 49,
        fit: BoxFit.cover,
      ),
    );
  }
}
