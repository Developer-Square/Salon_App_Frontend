import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final String photoUrl;
  final double height;
  final double width;
  final bool borderRadius;

  @override
  ImageDisplay(
      {@required this.photoUrl, this.height, this.width, this.borderRadius});

  Widget build(BuildContext buildContext) {
    return Hero(
      tag: photoUrl,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: borderRadius
                ? BorderRadius.circular(6.0)
                : BorderRadius.circular(1.0),
            image: DecorationImage(
              image: AssetImage(photoUrl),
              fit: BoxFit.cover,
            )),
        height: height ?? 55.0,
        width: width ?? 55.0,
      ),
    );
  }
}
