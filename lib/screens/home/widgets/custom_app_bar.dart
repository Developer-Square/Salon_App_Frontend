import 'package:flutter/material.dart';
import 'package:salon/widgets/image_display.dart';
import 'package:salon/screens/home/widgets/profile_icon.dart';

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
