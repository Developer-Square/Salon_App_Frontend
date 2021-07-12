import 'package:flutter/material.dart';
import 'package:salon/configs/app_globals.dart';
import 'package:salon/widgets/image_display.dart';

/// Builds out the circular profile image.
///
/// Requires [photoUrl].
class ProfileIcon extends StatelessWidget {
  final String photoUrl;
  final double height;
  final double width;

  ProfileIcon({@required this.photoUrl, this.height, this.width});

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: AppGlobals().primaryColor),
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

class CustomAppBar extends StatefulWidget {
  final String activePage;

  CustomAppBar({@required this.activePage});
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

/// Creates a reusable app bar to be used in different pages.
///
class _CustomAppBarState extends State<CustomAppBar> {
  Widget _buildProfilePhotoSection(
      String photoUrl, double height, double width) {
    return InkWell(
        onTap: () {},
        child: ProfileIcon(
          photoUrl: photoUrl,
        ));
  }

  @override
  Widget build(BuildContext buildContext) {
    // To avoid a lot of repitition when needed.
    final Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: 70.0,
      width: mediaQuery.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildProfilePhotoSection(
              'assets/images/profile/profile-1.jpg', 50.0, 50.0),
          ImageDisplay(
            photoUrl: 'assets/images/icon.png',
            height: 60.0,
            width: 60.0,
            borderRadius: false,
          ),
          InkWell(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Icon(
                    Icons.search,
                    size: 25.0,
                  )))
        ],
      ),
    );
  }
}
