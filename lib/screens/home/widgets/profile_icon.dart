import 'package:salon/configs/app_globals.dart';
import 'package:flutter/material.dart';

/// Builds out the circular profile image.
///
/// Requires [photoUrl].
class ProfileIcon extends StatelessWidget {
  final String photoUrl;
  final double height;
  final double width;
  final String location;

  ProfileIcon(
      {@required this.photoUrl, this.height, this.width, this.location});

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2.5,
              color: location == 'comments'
                  ? Colors.transparent
                  : AppGlobals().primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(100.0))),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        child: Hero(
          tag: photoUrl,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(photoUrl),
              fit: BoxFit.cover,
            )),
            height: height ?? 50.0,
            width: width ?? 50.0,
          ),
        ),
      ),
    );
  }
}
