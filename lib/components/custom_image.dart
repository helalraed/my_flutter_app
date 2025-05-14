import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomImage({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://image.tmdb.org/t/p/w500$imageUrl',
      height: height,
      width: width,
      fit: fit,
    );
  }
}
