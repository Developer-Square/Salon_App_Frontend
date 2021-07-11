import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final String photoUrl;
  final double height;
  final double width;

  @override
  ImageDisplay({@required this.photoUrl, this.height, this.width});

  Widget build(BuildContext buildContext) {
    return Hero(
      tag: photoUrl,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(photoUrl),
          fit: BoxFit.scaleDown,
        )),
        height: height ?? 55.0,
        width: width ?? 55.0,
      ),
    );
  }
}
