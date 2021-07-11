import 'package:flutter/material.dart';
import 'package:salon/configs/app_globals.dart';
import 'package:salon/widgets/image_display.dart';

class CustomAppBar extends StatefulWidget {
  final String activePage;

  CustomAppBar({@required this.activePage});
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

/// Creates a reusable app bar to be used in different pages.
///
class _CustomAppBarState extends State<CustomAppBar> {
  Widget _buildProfilePhotoSection(String photoUrl) {
    return InkWell(
      onTap: () {},
      child: Container(
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
              height: 50.0,
              width: 50.0,
            ),
          ),
        ),
      ),
    );
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
          _buildProfilePhotoSection('assets/images/profile/profile-1.jpg'),
          ImageDisplay(
            photoUrl: 'assets/images/icon.png',
            height: 65.0,
            width: 232.0,
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
